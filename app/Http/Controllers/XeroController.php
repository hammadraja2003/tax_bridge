<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use XeroAPI\XeroPHP\Api\AccountingApi;
use XeroAPI\XeroPHP\Configuration;
use XeroAPI\XeroPHP\OAuth2\Identity;
use GuzzleHttp\Client;
use App\Models\XeroInvoice;


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
            'scope' => 'openid profile email accounting.transactions offline_access'
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

            return redirect('/xero/invoices')->with('success', 'Xero connected!');
        } catch (\Exception $e) {
            return redirect('/')->with('error', 'Failed to get access token: ' . $e->getMessage());
        }
    }
    public function print(){
        return view('xero.print');
    }



    // public function invoices()
    // {
    //     $token = session('xero_token');
    //     if (!$token) return redirect('/xero/connect');

    //     $config = Configuration::getDefaultConfiguration()
    //         ->setAccessToken($token->getToken());

    //     // Optional: Customize HTTP client
    //     $client = new Client(['timeout' => 60]);

    //     $accountingApi = new AccountingApi($client, $config);

    //     // Get tenant ID
    //     $identityApi = new \XeroAPI\XeroPHP\Api\IdentityApi($client, $config);
    //     $tenants = $identityApi->getConnections();
    //     $tenantId = $tenants[0]->getTenantId();

    //     // Fetch invoices for json response
    //     $invoices = $accountingApi->getInvoices($tenantId);

    //     $this->syncInvoicesFromXero($invoices->getInvoices());


    //     //return response()->json($invoices->getInvoices());
    //     //return view('xero.invoices', compact('invoices'));
    // }

    public function invoices()
    {
        $token = session('xero_token');
        if (!$token) return redirect('/xero/connect');

        $config = Configuration::getDefaultConfiguration()
            ->setAccessToken($token->getToken());

        $client = new Client(['timeout' => 60]);

        $accountingApi = new AccountingApi($client, $config);

        // Get tenant ID
        $identityApi = new \XeroAPI\XeroPHP\Api\IdentityApi($client, $config);
        $tenants = $identityApi->getConnections();
        $tenantId = $tenants[0]->getTenantId();

        // Fetch and sync invoices
        $invoices = $accountingApi->getInvoices($tenantId);
        $this->syncInvoicesFromXero($invoices->getInvoices());

        // ✅ Redirect to DB view after syncing
        return redirect()->route('xero.db_invoices')->with('success', 'Invoices fetched & synced successfully.');
    }




    public function syncInvoicesFromXero($invoices)
    {
        foreach ($invoices as $inv) {
            $invoiceId = $inv->getInvoiceId();

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
                    'date' => optional($inv->getDate())->format('Y-m-d H:i:s'),
                    'due_date' => optional($inv->getDueDate())->format('Y-m-d H:i:s'),
                    'updated_date_utc' => optional($inv->getUpdatedDateUtc())->format('Y-m-d H:i:s'),
                    'posted_to_fbr' => false,
                    'fbr_invoice_number' => null,
                ]);
            }
        }
    }


    public function showInvoicesFromDb()
    {
        $invoices = XeroInvoice::latest()->get(); // ✅ Get all records without pagination
        return view('xero.invoices_db', compact('invoices'));
    }
    public function all_invoices(){
        return view('xero.all_invoices');
    }

    public function postToFbr(Request $request)
    {
        $ids = $request->input('selected_invoices', []);

        if (empty($ids)) {
            return back()->with('error', 'No invoices selected.');
        }

        $invoices = XeroInvoice::whereIn('id', $ids)->where('posted_to_fbr', false)->get();
        dd($invoices);

        // foreach ($invoices as $invoice) {
        //     // 👉 Replace this block with your FBR posting logic/API call
        //     $fbrInvoiceNumber = 'FBR-' . strtoupper(substr(md5($invoice->invoice_number), 0, 8));

        //     $invoice->update([
        //         'posted_to_fbr' => true,
        //         'fbr_invoice_number' => $fbrInvoiceNumber,
        //     ]);
        // }

        //return back()->with('success', 'Selected invoices posted to FBR.');
    }
}