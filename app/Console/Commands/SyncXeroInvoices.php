<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\XeroToken;
use App\Models\SyncLog;
use App\Http\Controllers\XeroController;
use GuzzleHttp\Client;
use XeroAPI\XeroPHP\Api\AccountingApi;
use XeroAPI\XeroPHP\Configuration;

class SyncXeroInvoices extends Command
{
    protected $signature = 'xero:sync-invoices';
    protected $description = 'Sync invoices for all connected Xero tenants';

    public function handle()
    {
        $tokens = XeroToken::all();

        foreach ($tokens as $token) {
            $this->info("🔁 Syncing for tenant: " . $token->tenant_name);

            // Refresh token if expired
            if (now()->gte($token->expires_at)) {
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
                } catch (\Exception $e) {
                    \Log::error("❌ Failed to refresh token for tenant: {$token->tenant_name}", ['message' => $e->getMessage()]);
                    continue;
                }
            }

            try {
                $config = Configuration::getDefaultConfiguration()->setAccessToken($token->access_token);
                $client = new Client(['timeout' => 60]);
                $accountingApi = new AccountingApi($client, $config);

                // 🔍 Only fetch updated invoices since last sync
                // $lastSyncedAt = $token->last_synced_at ?? now()->subMonths(6);
                // $where = sprintf('UpdatedDateUTC >= DateTime(%s)', $lastSyncedAt->format('Y-m-d\TH:i:s'));

                $lastSyncedAt = $token->last_synced_at ?? now()->subMonths(6);
                $where = sprintf(
                    'UpdatedDateUTC >= DateTime(%s)',
                    $lastSyncedAt->format('Y,m,d,H,i,s') // ✅ Xero uses comma-separated params, not ISO8601 string
                );



                $invoices = $accountingApi->getInvoices($token->tenant_id, null, $where);
                $count = count($invoices->getInvoices());


                $tenant = new class(
                    $token->tenant_id,
                    $token->tenant_name,
                    $token->tenant_type,
                    now(),
                    now()
                ) {
                    public function __construct(
                        protected $id,
                        protected $name,
                        protected $type,
                        protected $createdAt,
                        protected $updatedAt
                    ) {}

                    public function getTenantId()
                    {
                        return $this->id;
                    }
                    public function getTenantName()
                    {
                        return $this->name;
                    }
                    public function getTenantType()
                    {
                        return $this->type;
                    }
                    public function getCreatedDateUtc()
                    {
                        return $this->createdAt;
                    }
                    public function getUpdatedDateUtc()
                    {
                        return $this->updatedAt;
                    }
                };


                // 🧠 Call sync function
                (new XeroController())->syncInvoicesFromXero(
                    $invoices->getInvoices(),
                    $tenant,
                    $token->organisation_id,
                    $accountingApi
                );

                // (new XeroController())->syncInvoicesFromXero(
                //     $invoices->getInvoices(),
                //     (object)[
                //         'getTenantId' => fn() => $token->tenant_id,
                //         'getTenantName' => fn() => $token->tenant_name,
                //         'getTenantType' => fn() => $token->tenant_type,
                //         'getCreatedDateUtc' => fn() => now(),
                //         'getUpdatedDateUtc' => fn() => now(),
                //     ],
                //     $token->organisation_id,
                //     $accountingApi
                // );

                // 🕓 Update sync timestamp
                $token->update(['last_synced_at' => now()]);

                // ✅ Log success
                SyncLog::create([
                    'tenant_id' => $token->tenant_id,
                    'tenant_name' => $token->tenant_name,
                    'status' => 'success',
                    'message' => "{$count} invoices synced",
                ]);
            } catch (\Exception $e) {
                \Log::error("❌ Failed to sync invoices for tenant: {$token->tenant_name}", ['message' => $e->getMessage()]);
            }
        }

        $this->info('✅ All tenants synced.');
    }
}