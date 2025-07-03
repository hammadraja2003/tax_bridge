<?php

namespace App\Services\Xero;

use App\Models\XeroToken;
use App\Models\SyncLog;
use App\Http\Controllers\XeroController;
use GuzzleHttp\Client;
use XeroAPI\XeroPHP\Api\AccountingApi;
use XeroAPI\XeroPHP\Configuration;

class InvoiceSyncService
{
    public function syncAllTenants()
    {
        $tokens = XeroToken::all();

        foreach ($tokens as $token) {
            $this->syncTenant($token);
        }
    }

    public function syncTenant(XeroToken $token)
    {
        // Refresh token if expired
        if (now()->gte($token->expires_at)) {
            $newToken = $this->refreshToken($token);
            if (!$newToken) return;
        }

        $config = Configuration::getDefaultConfiguration()->setAccessToken($token->access_token);
        $client = new Client(['timeout' => 60]);
        $accountingApi = new AccountingApi($client, $config);

        // Only fetch updated invoices since last sync
        $lastSyncedAt = $token->last_synced_at ?? now()->subMonths(6);
        $where = sprintf(
            'UpdatedDateUTC >= DateTime(%s)',
            $lastSyncedAt->format('Y,m,d,H,i,s') // ✅ Xero uses comma-separated params, not ISO8601 string
        );



        $invoices = $accountingApi->getInvoices($token->tenant_id, null, $where);
        $count = count($invoices->getInvoices());

        // Call controller method
        (new XeroController())->syncInvoicesFromXero(
            $invoices->getInvoices(),
            (object)[
                'getTenantId' => fn() => $token->tenant_id,
                'getTenantName' => fn() => $token->tenant_name,
                'getTenantType' => fn() => $token->tenant_type,
                'getCreatedDateUtc' => fn() => now(),
                'getUpdatedDateUtc' => fn() => now(),
            ],
            $token->organisation_id,
            $accountingApi
        );

        // Update last sync timestamp
        $token->update(['last_synced_at' => now()]);

        // Log success
        SyncLog::create([
            'tenant_id' => $token->tenant_id,
            'tenant_name' => $token->tenant_name,
            'status' => 'success',
            'message' => "{$count} invoices synced",
        ]);
    }

    private function refreshToken(XeroToken $token)
    {
        $provider = new \League\OAuth2\Client\Provider\GenericProvider([
            'clientId' => env('XERO_CLIENT_ID'),
            'clientSecret' => env('XERO_CLIENT_SECRET'),
            'redirectUri' => env('XERO_REDIRECT_URI'),
            'urlAuthorize' => 'https://login.xero.com/identity/connect/authorize',
            'urlAccessToken' => 'https://identity.xero.com/connect/token',
            'urlResourceOwnerDetails' => ''
        ]);

        try {
            $newToken = $provider->getAccessToken('refresh_token', [
                'refresh_token' => $token->refresh_token,
            ]);

            $token->update([
                'access_token' => $newToken->getToken(),
                'refresh_token' => $newToken->getRefreshToken(),
                'expires_at' => now()->addSeconds($newToken->getExpires()),
            ]);

            return $newToken;
        } catch (\Exception $e) {
            \Log::error("❌ Failed to refresh token for tenant: {$token->tenant_name}", [
                'message' => $e->getMessage()
            ]);
            return null;
        }
    }
}