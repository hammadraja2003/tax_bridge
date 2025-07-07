<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\DB;

use App\Models\Invoice;
use App\Models\InvoiceDetail;
use App\Models\Buyer;
use App\Models\BusinessConfiguration;
use App\Models\Item;

class InvoiceController extends Controller
{

    public function create()
    {
        // return view('invoices.create', [
        //     'buyers' => Buyer::all(),
        //     'sellers' => BusinessConfiguration::all()
        // ]);
        $seller = BusinessConfiguration::first(); // Single config
        $buyers = Buyer::all();
        $items = Item::all();

        return view('invoices.create', compact('seller', 'buyers', 'items'));
    }

    public function index(Request $request)
    {
        $query = Invoice::with('buyer', 'seller');

        if ($request->has('invoice_type')) {
            $query->where('invoice_type', $request->invoice_type);
        }

        if ($request->has('date_from') && $request->has('date_to')) {
            $query->whereBetween('invoice_date', [$request->date_from, $request->date_to]);
        }

        $invoices = $query->orderByDesc('invoice_date')->paginate(10);

        return view('invoices.index', compact('invoices'));
    }


    public function createNewInvoice(Request $request)
    {
        $data = $request->all();

        DB::beginTransaction();

        try {
            // Step 1: Create the Invoice
            $invoice = Invoice::create([
                'invoice_type' => $data['invoiceType'],
                'invoice_date' => $data['invoiceDate'],
                'scenario_id' => $data['scenarioId'] ?? null,
                'invoice_ref_no' => $data['invoiceRefNo'] ?? null,
                'seller_id' => $data['seller_id'], // From hidden input or session
                'buyer_id' => $data['buyer_id'],   // From hidden input or dropdown
                'is_posted_to_fbr' => 0,
            ]);

            // Step 2: Create Invoice Details
            foreach ($data['items'] as $item) {
                InvoiceDetail::create([
                    'invoice_id' => $invoice->invoice_id,
                    'item_id' => $item['item_id'] ?? null,
                    'quantity' => $item['quantity'],
                    'total_value' => $item['totalValues'],
                    'value_excl_tax' => $item['valueSalesExcludingST'],
                    'retail_price' => $item['fixedNotifiedValueOrRetailPrice'],
                    'sales_tax_applicable' => $item['SalesTaxApplicable'],
                    'sales_tax_withheld' => $item['SalesTaxWithheldAtSource'],
                    'extra_tax' => $item['extraTax'] ?? 0,
                    'further_tax' => $item['furtherTax'] ?? 0,
                    'fed_payable' => $item['fedPayable'] ?? 0,
                    'discount' => $item['discount'] ?? 0,
                    'sale_type' => $item['saleType'],
                    'sro_schedule_no' => $item['sroScheduleNo'] ?? null,
                    'sro_item_serial_no' => $item['sroItemSerialNo'] ?? null,
                ]);
            }

            // Step 3: Prepare Payload for FBR API
            $payload = [
                'invoiceType' => $data['invoiceType'],
                'invoiceDate' => $data['invoiceDate'],
                'sellerNTNCNIC' => $data['sellerNTNCNIC'],
                'sellerBusinessName' => $data['sellerBusinessName'],
                'sellerProvince' => $data['sellerProvince'],
                'sellerAddress' => $data['sellerAddress'],
                'buyerNTNCNIC' => $data['buyerNTNCNIC'] ?? '',
                'buyerBusinessName' => $data['buyerBusinessName'] ?? '',
                'buyerProvince' => $data['buyerProvince'] ?? '',
                'buyerAddress' => $data['buyerAddress'] ?? '',
                'buyerRegistrationType' => $data['buyerRegistrationType'],
                'invoiceRefNo' => $data['invoiceRefNo'] ?? '',
                'scenarioId' => $data['scenarioId'] ?? '',
                'items' => [],
            ];

            foreach ($data['items'] as $item) {
                $payload['items'][] = [
                    'hsCode' => $item['hsCode'] ?? '',
                    'productDescription' => $item['productDescription'],
                    'rate' => $item['rate'],
                    'uoM' => $item['uoM'],
                    'quantity' => (int) $item['quantity'],
                    'totalValues' => (float) $item['totalValues'],
                    'valueSalesExcludingST' => (float) $item['valueSalesExcludingST'],
                    'fixedNotifiedValueOrRetailPrice' => (float) $item['fixedNotifiedValueOrRetailPrice'],
                    'SalesTaxApplicable' => (float) $item['SalesTaxApplicable'],
                    'SalesTaxWithheldAtSource' => (float) $item['SalesTaxWithheldAtSource'],
                    'extraTax' => (float) ($item['extraTax'] ?? 0),
                    'furtherTax' => (float) ($item['furtherTax'] ?? 0),
                    'sroScheduleNo' => $item['sroScheduleNo'] ?? '',
                    'fedPayable' => (float) ($item['fedPayable'] ?? 0),
                    'discount' => (float) ($item['discount'] ?? 0),
                    'saleType' => $item['saleType'],
                    'sroItemSerialNo' => $item['sroItemSerialNo'] ?? '',
                ];
            }

            dd($payload);

            // Step 4: Send to FBR API
            // $response = Http::withHeaders([
            //     'Authorization' => 'Bearer YOUR_FBR_TOKEN_HERE',
            //     'Content-Type' => 'application/json',
            // ])->post('https://gw.fbr.gov.pk/di_data/v1/di/postinvoicedata', $payload);

            // $responseData = $response->json();

            // // Step 5: Update invoice with FBR response
            // $invoice->update([
            //     'fbr_invoice_number' => $responseData['invoiceNumber'] ?? null,
            //     'is_posted_to_fbr' => 1,
            //     'response_status' => $responseData['validationResponse']['status'] ?? 'Unknown',
            //     'response_message' => $responseData['validationResponse']['error'] ?? '',
            // ]);

            DB::commit();

            return back()->with('success', 'Invoice successfully posted to FBR.');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', 'Error: ' . $e->getMessage());
        }
    }
}