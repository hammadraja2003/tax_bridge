<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use XeroAPI\XeroPHP\Api\AccountingApi;
use XeroAPI\XeroPHP\Configuration;
use XeroAPI\XeroPHP\OAuth2\Identity;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\ClientException;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use XeroAPI\XeroPHP\Api\IdentityApi;
use Illuminate\Support\Facades\DB;
use App\Models\XeroInvoice;
use App\Models\XeroInvoiceItem;
use Illuminate\Support\Facades\Http;
use App\Models\XeroToken;
use App\Models\XeroContact;
use League\OAuth2\Client\Provider\GenericProvider;
use App\Services\Xero\InvoiceSyncService;

use Illuminate\Support\Facades\Crypt;



class XeroController extends Controller
{
    public function connect()
    {
        $provider = new \League\OAuth2\Client\Provider\GenericProvider([
            'clientId' => env('XERO_CLIENT_ID'),
            'clientSecret' => env('XERO_CLIENT_SECRET'),
            'redirectUri' => env('XERO_REDIRECT_URI'),
            'urlAuthorize' => 'https://login.xero.com/identity/connect/authorize',
            'urlAccessToken' => 'https://identity.xero.com/connect/token',
            'urlResourceOwnerDetails' => ''
        ]);

        $authUrl = $provider->getAuthorizationUrl([
            'scope' => 'openid profile email accounting.transactions accounting.settings offline_access'
        ]);

        session(['oauth2state' => $provider->getState()]);

        return redirect()->away($authUrl);
    }
    public function callback(Request $request)
    {
        $provider = new GenericProvider([
            'clientId'                => env('XERO_CLIENT_ID'),
            'clientSecret'            => env('XERO_CLIENT_SECRET'),
            'redirectUri'             => env('XERO_REDIRECT_URI'),
            'urlAuthorize'            => 'https://login.xero.com/identity/connect/authorize',
            'urlAccessToken'          => 'https://identity.xero.com/connect/token',
            'urlResourceOwnerDetails' => ''
        ]);

        // 🔐 Validate OAuth state
        if ($request->get('state') !== session('oauth2state')) {
            return redirect('/')->with('error', 'Invalid OAuth state');
        }

        try {
            // 🔑 Get access token using authorization code
            $accessToken = $provider->getAccessToken('authorization_code', [
                'code' => $request->get('code')
            ]);

            // 🧠 Get Xero tenants
            $client = new Client();
            $config = Configuration::getDefaultConfiguration()->setAccessToken($accessToken->getToken());
            $identityApi = new IdentityApi($client, $config);
            $tenants = $identityApi->getConnections();
            if (empty($tenants)) {
                return redirect()->route('xero.error')->with('error', 'No Xero tenants found.');
            }


            // 💾 Save token for each tenant
            foreach ($tenants as $tenant) {
                XeroToken::updateOrCreate(
                    ['tenant_id' => $tenant->getTenantId()],
                    [
                        'tenant_name'     => $tenant->getTenantName(),
                        'tenant_type'     => $tenant->getTenantType(),
                        'organisation_id' => null, // optional; populate later
                        'access_token'    => $accessToken->getToken(),
                        'refresh_token'   => $accessToken->getRefreshToken(),
                        'expires_at'      => now()->addSeconds($accessToken->getExpires()),
                    ]
                );
            }

            // return redirect('/xero/invoices')->with('message', 'Xero connected and tokens stored!');
            return redirect()->route('xero.all_invoices', ['tenant_id' => Crypt::encryptString($tenants[0]->getTenantId())])
                ->with('message', 'Xero connected and tokens stored!');
        } catch (\Exception $e) {
            \Log::error('Xero callback error', ['message' => $e->getMessage()]);
            return redirect()->route('xero.error')->with('error', 'Unexpected error: ' . $e->getMessage());
        }
    }
    public function invoices(Request $request)
    {
        $token = session('xero_token');

        if (!$token || $token->hasExpired()) {
            // Fallback to DB token
            $dbToken = XeroToken::first(); // Or filter by tenant if needed

            if (!$dbToken || now()->gte($dbToken->expires_at)) {
                return redirect('/xero/connect')->with('error', 'Token expired or not found. Reconnect to Xero.');
            }

            $accessToken = new \League\OAuth2\Client\Token\AccessToken([
                'access_token'  => $dbToken->access_token,
                'refresh_token' => $dbToken->refresh_token,
                'expires'       => \Carbon\Carbon::parse($dbToken->expires_at)->timestamp,
            ]);


            session(['xero_token' => $accessToken]);
            $token = $accessToken;
        }

        try {
            $config = Configuration::getDefaultConfiguration()
                ->setAccessToken($token->getToken());

            $client = new Client(['timeout' => 60]);
            $accountingApi = new AccountingApi($client, $config);
            // Get tenant ID
            $identityApi = new \XeroAPI\XeroPHP\Api\IdentityApi($client, $config);
            $tenants = $identityApi->getConnections();
            if (empty($tenants)) {
                return redirect()->route('xero.error')->with('error', 'No Xero tenants found for this account.');
            }
            $tenant = $tenants[0];
            $tenantId = $tenant->getTenantId();

            // Get organisation ID from Accounting API
            $organisation = $accountingApi->getOrganisations($tenantId)->getOrganisations()[0];
            $organisationId = $organisation->getOrganisationID();

            // $startDate = Carbon::parse('2025-06-25')->format('Y-m-d');
            // $endDate = Carbon::now()->format('Y-m-d');

            // $where = sprintf(
            //     'Date >= DateTime(%s) OR Date <= DateTime(%s) AND Status == "AUTHORISED"',
            //     $startDate,
            //     $endDate
            // );
            //Date >= DateTime(%s) AND Date <= DateTime(%s) AND
            // $where = sprintf(
            //     'Status == "AUTHORISED"',
            //     $startDate,
            //     $endDate
            // );

            // \Log::info('Xero where filter', ['where' => $where]);

            // $invoices = $accountingApi->getInvoices($tenantId, null, $where, null);


            // $conditions = [];
            // $startDate = Carbon::parse('2025-06-25')->format('Y-m-d'); // e.g., 2025-06-25
            // $endDate =  Carbon::now()->format('Y-m-d');     // optional
            // $status = 'AUTHORISED';        // e.g., PAID, AUTHORISED

            // if ($startDate) {
            //     $conditions[] = 'Date >= DateTime(' . $startDate . ')';
            // }

            // if ($endDate) {
            //     $conditions[] = 'Date <= DateTime(' . $endDate . ')';
            // }

            // if ($status) {
            //     $conditions[] = 'Status == "' . strtoupper($status) . '"';
            // }

            // $where = implode(' AND ', $conditions);


            $conditions = [];
            $startDate = Carbon::parse('2025-06-25')->format('Y-m-d\TH:i:s');
            $endDate = Carbon::now()->format('Y-m-d\TH:i:s');
            $status = 'AUTHORISED';

            // if ($startDate) {
            //     $conditions[] = 'Date >= DateTime("' . $startDate . '")';
            // }
            // if ($endDate) {
            //     $conditions[] = 'Date <= DateTime("' . $endDate . '")';
            // }
            if ($status) {
                $conditions[] = 'Status == "' . strtoupper($status) . '"';
            }

            $where = implode(' AND ', $conditions);
            $invoices = $accountingApi->getInvoices($tenantId, null, $where);





            // Invoice History
            // $result = $accountingApi->getInvoiceHistory($tenantId, $invoiceID);
            ini_set('max_execution_time', 300); // 5 minutes
            $this->syncInvoicesFromXero($invoices->getInvoices(), $tenant, $organisationId, $accountingApi);

            return redirect()->route('xero.all_invoices')->with('message', 'Invoices synced successfully.');
        } catch (ClientException $e) {
            \Log::error('Xero unexpected error', ['message' => $e->getMessage()]);
            $responseBody = json_decode((string) $e->getResponse()->getBody(), true);
            $detail = $responseBody['Detail'] ?? '';

            if (str_contains($detail, 'TokenExpired') || str_contains($detail, 'AuthorizationUnsuccessful')) {
                session()->forget('xero_token'); // 🔁 Force re-auth
                return redirect('/xero/connect')->with('error', 'Xero session expired or unauthorized. Please reconnect.');
            }
            return redirect()->route('xero.error')->with('error', 'Unexpected error: ' . $detail);
        } catch (\Exception $e) {
            return redirect()->route('xero.error')->with('error', 'Unexpected error: ' . $e->getMessage());
        }
    }
    public function syncInvoicesFromXero($invoices, $tenant, $organisationId, AccountingApi $accountingApi)
    {
        \DB::beginTransaction();

        try {
            foreach ($invoices as $inv) {
                $invoiceId = $inv->getInvoiceId();
                $tenant_id = $tenant->getTenantId();

                if (!XeroInvoice::where('invoice_id', $invoiceId)->exists()) {

                    // 👉 Handle contact
                    $contact = $inv->getContact();
                    $contactId = null;

                    if ($contact && $contact->getContactID()) {
                        $contactModel = XeroContact::updateOrCreate(
                            ['contact_id' => $contact->getContactID()],
                            [
                                'name' => $contact->getName(),
                                'email' => $contact->getEmailAddress(),
                                'first_name' => $contact->getFirstName(),
                                'last_name' => $contact->getLastName(),
                                'contact_number' => $contact->getContactNumber(),
                                'account_number' => $contact->getAccountNumber(),
                                'tenant_id' => $tenant_id,
                            ]
                        );

                        $contactId = $contactModel->id;
                    }

                    XeroInvoice::create([
                        'invoice_id' => $invoiceId,
                        'type' => $inv->getType(),
                        'invoice_number' => $inv->getInvoiceNumber(),
                        'reference' => $inv->getReference(),
                        'status' => $inv->getStatus(),
                        'currency_code' => $inv->getCurrencyCode(),
                        'sub_total' => $inv->getSubTotal(),
                        'total_tax' => $inv->getTotalTax(),
                        'total' => $inv->getTotal(),
                        'amount_due' => $inv->getAmountDue(),
                        'amount_paid' => $inv->getAmountPaid(),
                        'amount_credited' => $inv->getAmountCredited(),
                        'is_discounted' => $inv->getIsDiscounted(),
                        'has_attachments' => $inv->getHasAttachments(),
                        'date' => convertXeroDate($inv->getDate()),
                        'due_date' => convertXeroDate($inv->getDueDate()),
                        'updated_date_utc' => convertXeroDate($inv->getUpdatedDateUtc()),
                        'posted_to_fbr' => false,
                        'fbr_invoice_number' => null,

                        // Tenant fields
                        'tenant_id' => $tenant_id,
                        'tenant_name' => $tenant->getTenantName(),
                        'tenant_type' => $tenant->getTenantType(),
                        'organisation_id' => $organisationId,
                        'tenant_created_at' => $tenant->getCreatedDateUtc(),
                        'tenant_updated_at' => $tenant->getUpdatedDateUtc(),

                        // Contact Fields
                        'contact_id' => $contactId,
                    ]);
                    $lineItems = $inv->getLineItems();
                    if (empty($lineItems)) {
                        // Fallback to full invoice call
                        $unitdp = 2;
                        $invoiceResponse = $accountingApi->getInvoice($tenant_id, $invoiceId, $unitdp);
                        $invoice = $invoiceResponse->getInvoices()[0];
                        $lineItems = $invoice->getLineItems();
                    }
                    // \Log::info('Line items for invoice ' . $invoiceId, ['count' => count($lineItems)]);
                    foreach ($lineItems as $item) {
                        XeroInvoiceItem::create([
                            'invoice_id'  => $invoiceId,
                            'description' => $item->getDescription(),
                            'quantity'    => $item->getQuantity(),
                            'unit_amount' => $item->getUnitAmount(),
                            'line_amount' => $item->getLineAmount(),
                            'item_code'   => $item->getItemCode(),
                            'tax_amount'  => $item->getTaxAmount(),
                        ]);
                        sleep(1); // Prevent 429 error
                    }
                }
            }

            \DB::commit();
        } catch (\Exception $e) {
            \DB::rollBack();
            \Log::error('Xero invoice sync error', ['message' => $e->getMessage()]);
            throw $e;
        }
    }
    public function selectTenant()
    {
        $tenants = XeroToken::all(); // show from your DB

        if ($tenants->isEmpty()) {
            return redirect('/xero/connect')->with('error', 'No tenants found. Please connect to Xero.');
        }
        return view('xero.select_tenant', ['tenants' => $tenants]);
    }

    public function syncSelectedTenant(Request $request)
    {
        $tenantId = $request->tenant_id;

        // Step 1: Load token from DB by tenant_id
        $dbToken = XeroToken::where('tenant_id', $tenantId)->first();
        if (!$dbToken) {
            return redirect('/xero/connect')->with('error', 'Token not found.');
        }

        // Step 2: Rebuild AccessToken from DB
        $token = new \League\OAuth2\Client\Token\AccessToken([
            'access_token'  => $dbToken->access_token,
            'refresh_token' => $dbToken->refresh_token,
            'expires'       => \Carbon\Carbon::parse($dbToken->expires_at)->timestamp,
        ]);

        // Step 3: Refresh token if expired
        if ($token->hasExpired()) {
            $oauthClient = new \League\OAuth2\Client\Provider\GenericProvider([
                'clientId'                => env('XERO_CLIENT_ID'),
                'clientSecret'            => env('XERO_CLIENT_SECRET'),
                'redirectUri'             => env('XERO_REDIRECT_URI'),
                'urlAuthorize'            => 'https://login.xero.com/identity/connect/authorize',
                'urlAccessToken'          => 'https://identity.xero.com/connect/token',
                'urlResourceOwnerDetails' => '',
            ]);

            try {
                $newToken = $oauthClient->getAccessToken('refresh_token', [
                    'refresh_token' => $token->getRefreshToken()
                ]);

                // Update DB with new token
                $dbToken->update([
                    'access_token'  => $newToken->getToken(),
                    'refresh_token' => $newToken->getRefreshToken(),
                    'expires_at'    => now()->addSeconds($newToken->getExpires()),
                ]);

                $token = $newToken;
            } catch (\Exception $e) {
                \Log::error('Token refresh failed in syncSelectedTenant', ['error' => $e->getMessage()]);
                return redirect('/xero/connect')->with('error', 'Token refresh failed. Please reconnect.');
            }
        }

        // ✅ Build API clients AFTER token is final (refreshed or valid)
        $config = \XeroAPI\XeroPHP\Configuration::getDefaultConfiguration()->setAccessToken($token->getToken());
        $client = new \GuzzleHttp\Client(['timeout' => 60]);
        $accountingApi = new \XeroAPI\XeroPHP\Api\AccountingApi($client, $config);

        try {
            // Step 5: Build fake tenant object like SDK returns
            $tenant = new class(
                $dbToken->tenant_id,
                $dbToken->tenant_name,
                $dbToken->tenant_type,
                now(),
                now()
            ) {
                public function __construct($id, $name, $type, $createdAt, $updatedAt)
                {
                    $this->id = $id;
                    $this->name = $name;
                    $this->type = $type;
                    $this->createdAt = $createdAt;
                    $this->updatedAt = $updatedAt;
                }
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

            // Step 6: Fetch organisation info
            $organisation = $accountingApi->getOrganisations($tenantId)->getOrganisations()[0];

            // Step 7: Fetch invoices from Xero
            $invoices = $accountingApi->getInvoices($tenantId);

            // Step 8: Sync invoices
            ini_set('max_execution_time', 300); // 5 minutes
            $this->syncInvoicesFromXero($invoices->getInvoices(), $tenant, $organisation->getOrganisationID(), $accountingApi);

            // Step 9: Redirect with success
            return redirect()->route('xero.all_invoices', ['tenant_id' => Crypt::encryptString($tenantId)])
                ->with('message', 'Invoices synced for selected tenant.');
        } catch (\Exception $e) {
            \Log::error('Failed to sync selected tenant', ['message' => $e->getMessage()]);
            return redirect()->back()->with('error', 'Sync failed: ' . $e->getMessage());
        }
    }


    public function showInvoicesFromDb()
    {
        $invoices = XeroInvoice::with('items')->latest()->get();
        return view('xero.invoices_db', compact('invoices'));
    }

    public function all_invoices($tenant_id = null)
    {
        $query = XeroInvoice::with('items')->latest();

        $decryptedTenantId = null;

        if ($tenant_id) {
            try {
                $decryptedTenantId = Crypt::decryptString($tenant_id);
                $query->where('tenant_id', $decryptedTenantId);
            } catch (\Exception $e) {
                return redirect()->route('xero.error')->with('error', 'Invalid or tampered tenant ID.');
            }
        }

        $invoices = $query->get();

        return view('xero.all_invoices', [
            'invoices' => $invoices,
            'tenant_id' => $decryptedTenantId
        ]);
    }
    public function print($encryptedId)
    {
        try {
            $id = Crypt::decryptString($encryptedId);
            $invoice = XeroInvoice::with('items')->findOrFail($id);
            return view('xero.print', compact('invoice'));
        } catch (\Illuminate\Contracts\Encryption\DecryptException $e) {
            abort(404);
        }
    }


    public function postToFbr(Request $request)
    {

        $ids = $request->input('selected_invoices', []);

        dd($ids);
        if (empty($ids)) {
            return back()->with('error', 'No invoices selected.');
        }

        DB::beginTransaction();

        try {
            $invoices = XeroInvoice::with('items') // Load invoice items
                ->whereIn('id', $ids)
                ->where('posted_to_fbr', false)
                ->lockForUpdate()
                ->get();

            foreach ($invoices as $invoice) {
                try {
                    // 🔐 Replace this with your actual FBR bearer token
                    $token = 'your_fbr_token_here';

                    // 🧾 Prepare invoice payload for FBR
                    $payload = [
                        'InvoiceNumber' => $invoice->invoice_number,
                        'Date' => optional($invoice->date)->format('Y-m-d'),
                        'Customer' => [
                            'Name' => $invoice->tenant_name,
                            'NTN' => '0000000', // Use actual NTN if available
                        ],
                        'Items' => $invoice->items->map(function ($item) {
                            return [
                                'ItemCode' => $item->item_code,
                                'Description' => $item->description,
                                'Quantity' => $item->quantity,
                                'Rate' => $item->unit_amount,
                                'Tax' => $item->tax_amount,
                            ];
                        })->toArray(),
                    ];

                    $response = Http::withToken($token)
                        ->withHeaders([
                            'Accept' => 'application/json',
                        ])
                        ->post('https://gw.fbr.gov.pk/di_data/v1/di/postinvoicedata_sb', $payload);

                    if ($response->successful()) {
                        $fbrResponse = $response->json();
                        $fbrInvoiceNumber = $fbrResponse['fbrInvoiceNumber'] ?? 'FBR-' . strtoupper(substr(md5($invoice->invoice_number . now()), 0, 8));

                        $invoice->update([
                            'posted_to_fbr' => true,
                            'fbr_invoice_number' => $fbrInvoiceNumber,
                        ]);
                    } else {
                        Log::error('FBR API error response', [
                            'invoice_id' => $invoice->id,
                            'status' => $response->status(),
                            'body' => $response->body()
                        ]);
                        continue;
                    }
                } catch (\Exception $apiEx) {
                    Log::error('Failed to post to FBR', [
                        'invoice_id' => $invoice->id,
                        'error' => $apiEx->getMessage(),
                    ]);
                    continue;
                }
            }

            DB::commit();
            return back()->with('message', 'Selected invoices posted to FBR.');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('FBR postToFbr failure', ['message' => $e->getMessage()]);
            return back()->with('error', 'An unexpected error occurred while posting to FBR.');
        }
    }
}