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
        $provider = new \League\OAuth2\Client\Provider\GenericProvider([
            'clientId' => env('XERO_CLIENT_ID'),
            'clientSecret' => env('XERO_CLIENT_SECRET'),
            'redirectUri' => env('XERO_REDIRECT_URI'),
            'urlAuthorize' => 'https://login.xero.com/identity/connect/authorize',
            'urlAccessToken' => 'https://identity.xero.com/connect/token',
            'urlResourceOwnerDetails' => ''
        ]);

        if ($request->get('state') !== session('oauth2state')) {
            return redirect('/')->with('error', 'Invalid OAuth state');
        }

        try {
            $accessToken = $provider->getAccessToken('authorization_code', [
                'code' => $request->get('code')
            ]);

            session(['xero_token' => $accessToken]);

            return redirect('/xero/invoices')->with('message', 'Xero connected!');
        } catch (\Exception $e) {
            \Log::error('Xero unexpected error', ['message' => $e->getMessage()]);
            return redirect()->route('xero.error')->with('error', 'Unexpected error: ' . $e->getMessage());
        }
    }

    public function invoices(Request $request)
    {
        $token = session('xero_token');
        if (!$token || $token->hasExpired()) {
            return redirect('/xero/connect')->with('error', 'Xero token expired. Please reconnect.');
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


            $conditions = [];
            $startDate = Carbon::parse('2025-06-25')->format('Y-m-d'); // e.g., 2025-06-25
            $endDate =  Carbon::now()->format('Y-m-d');     // optional
            $status = 'AUTHORISED';        // e.g., PAID, AUTHORISED

            // if ($startDate) {
            //     $conditions[] = 'Date >= DateTime(' . $startDate . ')';
            // }

            // if ($endDate) {
            //     $conditions[] = 'Date <= DateTime(' . $endDate . ')';
            // }

            // if ($status) {
            //     $conditions[] = 'Status == "' . strtoupper($status) . '"';
            // }

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
                    ]);

                    $lineItems = $inv->getLineItems();

                    if (empty($lineItems)) {
                        // Fallback to full invoice call
                        $unitdp = 2;
                        $invoiceResponse = $accountingApi->getInvoice($tenant_id, $invoiceId, $unitdp);
                        $invoice = $invoiceResponse->getInvoices()[0];
                        $lineItems = $invoice->getLineItems();
                    }

                    \Log::info('Line items for invoice ' . $invoiceId, ['count' => count($lineItems)]);

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

                    // $lineItems = $inv->getLineItems() ?? []; // ✅ Already available
                    // \Log::info('Line items for invoice ' . $invoiceId, ['items' => $lineItems]);
                    // foreach ($lineItems as $item) {
                    //     XeroInvoiceItem::create([
                    //         'invoice_id'  => $inv->getInvoiceId(),
                    //         'description' => $item->getDescription(),
                    //         'quantity'    => $item->getQuantity(),
                    //         'unit_amount' => $item->getUnitAmount(),
                    //         'line_amount' => $item->getLineAmount(),
                    //         'item_code'   => $item->getItemCode(),
                    //         'tax_amount'  => $item->getTaxAmount(),
                    //     ]);
                    // }
                }
            }

            \DB::commit();
        } catch (\Exception $e) {
            \DB::rollBack();
            \Log::error('Xero invoice sync error', ['message' => $e->getMessage()]);
            throw $e;
        }
    }

    public function showInvoicesFromDb()
    {
        $invoices = XeroInvoice::with('items')->latest()->get();
        return view('xero.invoices_db', compact('invoices'));
    }
    public function all_invoices(){
        $invoices = XeroInvoice::with('items')->latest()->get();
        return view('xero.all_invoices', compact('invoices'));
    }
    public function print(){
        return view('xero.print');
    }

    public function postToFbr(Request $request)
    {
        $ids = $request->input('selected_invoices', []);

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

    // Testing By Hammad

    // public function postToFbr(Request $request)
    // {
    //     $ids = $request->input('selected_invoices', []);

    //     if (empty($ids)) {
    //         return back()->with('error', 'No invoices selected.');
    //     }

    //     DB::beginTransaction();

    //     try {
    //         $invoices = XeroInvoice::whereIn('id', $ids)
    //             ->where('posted_to_fbr', false)
    //             ->lockForUpdate() // optional for safety in concurrent processing
    //             ->get();

    //         foreach ($invoices as $invoice) {
    //             try {
    //                 // 🛠️ Replace this with your actual FBR API call
    //                 // Example: $response = Http::post('https://fbr.gov/api/invoice', [...]);

    //                 // Simulate FBR API call with dummy FBR invoice number
    //                 $fbrInvoiceNumber = 'FBR-' . strtoupper(substr(md5($invoice->invoice_number . now()), 0, 8));

    //                 // On success, update invoice
    //                 $invoice->update([
    //                     'posted_to_fbr' => true,
    //                     'fbr_invoice_number' => $fbrInvoiceNumber,
    //                 ]);
    //             } catch (\Exception $apiEx) {
    //                 Log::error('Failed to post to FBR', [
    //                     'invoice_id' => $invoice->id,
    //                     'error' => $apiEx->getMessage(),
    //                 ]);
    //                 // You can optionally skip, retry, or abort
    //                 continue;
    //             }
    //         }

    //         DB::commit();

    //         return back()->with('success', 'Selected invoices posted to FBR.');
    //     } catch (\Exception $e) {
    //         DB::rollBack();
    //         Log::error('FBR postToFbr failure', ['message' => $e->getMessage()]);
    //         return back()->with('error', 'An unexpected error occurred while posting to FBR.');
    //     }
    // }
    // public function getXeroItems(Request $request)
    // {
    //     $token = session('xero_token');
    //     if (!$token || $token->hasExpired()) {
    //         return redirect('/xero/connect')->with('error', 'Xero token expired. Please reconnect.');
    //     }

    //     try {
    //         $config = Configuration::getDefaultConfiguration()
    //             ->setAccessToken($token->getToken());

    //         $client = new Client(['timeout' => 60]);
    //         $accountingApi = new AccountingApi($client, $config);

    //         // Get Tenant ID
    //         $identityApi = new \XeroAPI\XeroPHP\Api\IdentityApi($client, $config);
    //         $tenants = $identityApi->getConnections();

    //         if (empty($tenants)) {
    //             return redirect()->route('xero.error')->with('error', 'No Xero tenants found.');
    //         }

    //         $tenant = $tenants[0];
    //         $tenantId = $tenant->getTenantId();

    //         // Optional Filters
    //         $where = 'IsSold == true'; // Example filter
    //         $order = 'Code ASC';
    //         $unitdp = 4;
    //         $ifModifiedSince = null; // or: new \DateTime('2024-01-01T00:00:00Z');

    //         // Fetch Items
    //         $result = $accountingApi->getItems($tenantId, $ifModifiedSince, $where, $order, $unitdp);

    //         // You can dump, store, or display the items
    //         // Example:
    //         // return view('xero.items', ['items' => $result->getItems()]);
    //         dd($result->getItems());
    //     } catch (ClientException $e) {
    //         Log::error('Xero item fetch error', ['message' => $e->getMessage()]);
    //         return redirect()->route('xero.error')->with('error', 'Xero client error: ' . $e->getMessage());
    //     } catch (\Exception $e) {
    //         Log::error('Xero item general error', ['message' => $e->getMessage()]);
    //         //return redirect()->route('xero.error')->with('error', 'Unexpected error: ' . $e->getMessage());
    //     }
    // }
}