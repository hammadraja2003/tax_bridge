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
use Illuminate\Support\Facades\Crypt;

class InvoiceController extends Controller
{
    public function create()
    {
        $seller = BusinessConfiguration::first(); // Single config
        $buyers = Buyer::all();
        $items = Item::all();
        return view('invoices.create', compact('seller', 'buyers', 'items'));
    }
    public function index(Request $request)
    {
        $query = Invoice::with(['buyer', 'seller', 'details.item']);

        // Filter by invoice type
        if ($request->filled('invoice_type')) {
            $query->where('invoice_type', $request->invoice_type);
        }

        // Filter by date range
        if ($request->filled('date_from') && $request->filled('date_to')) {
            $query->whereBetween('invoice_date', [$request->date_from, $request->date_to]);
        }
        // Filter by fbr status
        if ($request->has('is_posted_to_fbr') && $request->is_posted_to_fbr !== '') {
            $query->where('is_posted_to_fbr', $request->is_posted_to_fbr);
        }

        // Paginate and preserve query parameters
        $invoices = $query->orderByDesc('invoice_date')->paginate(10)->appends($request->query());

        return view('invoices.index', compact('invoices'));
    }
    public function filter(Request $request)
    {
        return redirect()->route('invoices.index', [
            'invoice_type' => $request->invoice_type,
            'date_from' => $request->date_from,
            'date_to' => $request->date_to,
            'is_posted_to_fbr' => $request->is_posted_to_fbr,
        ]);
    }

    // public function createNewInvoice(Request $request)
    // {
    //     // Clean incoming data
    //     $data = $request->only([
    //         'invoiceType',
    //         'invoiceDate',
    //         'due_date',
    //         'scenarioId',
    //         'invoiceRefNo',
    //         'seller_id',
    //         'byr_id',
    //         'buyerRegistrationType',
    //         'sellerNTNCNIC',
    //         'sellerBusinessName',
    //         'sellerProvince',
    //         'sellerAddress',
    //         'buyerNTNCNIC',
    //         'buyerProvince',
    //         'buyerBusinessName',
    //         'buyerAddress',
    //         'totalAmountExcludingTax',
    //         'totalAmountIncludingTax',
    //         'totalSalesTax',
    //         'totalfurtherTax',
    //         'totalextraTax',
    //         'shipping_charges',
    //         'other_charges',
    //         'discount_amount',
    //         'payment_status',
    //         'notes',
    //         'items',
    //         'invoice_status',
    //     ]);

    //     // Filter incomplete items
    //     $filteredItems = array_filter($data['items'] ?? [], function ($item) {
    //         return isset($item['item_id'], $item['quantity'], $item['totalValues']);
    //     });

    //     $data['items'] = array_values($filteredItems);
    //     $request->merge(['items' => $data['items']]);

    //     // Validate main fields
    //     $request->validate([
    //         'invoiceType' => 'required|string',
    //         'invoiceDate' => 'required|date',
    //         'seller_id' => 'required|integer|exists:business_configurations,bus_config_id',
    //         'byr_id' => 'required|integer|exists:buyers,byr_id',
    //         'buyerRegistrationType' => 'required|string',
    //         'items.*.item_id' => 'required|integer',
    //         'items.*.quantity' => 'required|numeric|min:0.01',
    //         'items.*.totalValues' => 'required|numeric',
    //         'items.*.valueSalesExcludingST' => 'required|numeric',
    //         'items.*.SalesTaxApplicable' => 'required|numeric',
    //         'items.*.SalesTaxWithheldAtSource' => 'required|numeric',
    //         'items.*.saleType' => 'required|string',
    //         'items.*.productDescription' => 'required|string',
    //         'items.*.rate' => 'required|numeric',
    //         'items.*.uoM' => 'required|string',
    //     ]);

    //     DB::beginTransaction();

    //     try {
    //         $isDraft = $data['invoice_status'] == 1;

    //         // Create invoice
    //         $invoice = Invoice::create([
    //             'invoice_type' => $data['invoiceType'],
    //             'invoice_date' => $data['invoiceDate'],
    //             'due_date' => $data['due_date'],
    //             'scenario_id' => $data['scenarioId'] ?? null,
    //             'invoice_ref_no' => $data['invoiceRefNo'] ?? null,
    //             'seller_id' => $data['seller_id'],
    //             'buyer_id' => $data['byr_id'],
    //             'invoice_status' => $data['invoice_status'] ?? 1,
    //             'is_posted_to_fbr' => 0,
    //             'totalAmountExcludingTax' => $data['totalAmountExcludingTax'] ?? 0,
    //             'totalAmountIncludingTax' => $data['totalAmountIncludingTax'] ?? 0,
    //             'totalSalesTax' => $data['totalSalesTax'] ?? 0,
    //             'totalfurtherTax' => $data['totalfurtherTax'] ?? 0,
    //             'totalextraTax' => $data['totalextraTax'] ?? 0,
    //             'shipping_charges' => $data['shipping_charges'] ?? null,
    //             'other_charges' => $data['other_charges'] ?? null,
    //             'discount_amount' => $data['discount_amount'] ?? null,
    //             'payment_status' => $data['payment_status'] ?? null,
    //             'notes' => $data['notes'] ?? null,
    //         ]);

    //         // Only assign invoice_no if status is not draft
    //         if (!$isDraft) {
    //             $invoice->update([
    //                 'invoice_no' => 'INV-' . str_pad($invoice->invoice_id, 6, '0', STR_PAD_LEFT)
    //             ]);
    //         }

    //         // Insert invoice items
    //         foreach ($data['items'] as $item) {
    //             InvoiceDetail::create([
    //                 'invoice_id' => $invoice->invoice_id,
    //                 'item_id' => $item['item_id'],
    //                 'quantity' => $item['quantity'],
    //                 'total_value' => $item['totalValues'],
    //                 'value_excl_tax' => $item['valueSalesExcludingST'],
    //                 'retail_price' => $item['fixedNotifiedValueOrRetailPrice'] ?? null,
    //                 'sales_tax_applicable' => $item['SalesTaxApplicable'],
    //                 'sales_tax_withheld' => $item['SalesTaxWithheldAtSource'],
    //                 'extra_tax' => $item['extraTax'] ?? 0,
    //                 'further_tax' => $item['furtherTax'] ?? 0,
    //                 'fed_payable' => $item['fedPayable'] ?? 0,
    //                 'discount' => $item['discount'] ?? 0,
    //                 'sale_type' => $item['saleType'],
    //                 'sro_schedule_no' => $item['sroScheduleNo'] ?? null,
    //                 'sro_item_serial_no' => $item['sroItemSerialNo'] ?? null,
    //             ]);
    //         }

    //         // If posted, optionally send to FBR (logic placeholder)
    //         if (!$isDraft) {
    //             // Uncomment and implement this if you want live FBR posting:
    //             /*
    //         $responseData = Http::withHeaders([
    //             'Authorization' => 'Bearer YOUR_TOKEN',
    //             'Content-Type' => 'application/json',
    //         ])->post('https://gw.fbr.gov.pk/di_data/v1/di/postinvoicedata', [...])->json();

    //         $invoice->update([
    //             'fbr_invoice_number' => $responseData['invoiceNumber'] ?? null,
    //             'is_posted_to_fbr' => 1,
    //             'response_status' => $responseData['validationResponse']['status'] ?? 'Unknown',
    //             'response_message' => $responseData['validationResponse']['error'] ?? '',
    //         ]);
    //         */
    //         }

    //         DB::commit();

    //         return redirect()->route('invoices.index')->with('message', 'Invoice successfully created.');
    //     } catch (\Exception $e) {
    //         DB::rollBack();
    //         return back()->with('error', 'Error: ' . $e->getMessage());
    //     }
    // }

    public function storeOrUpdate(Request $request, $id = null)
    {
        $data = $request->only([
            'invoiceType',
            'invoiceDate',
            'due_date',
            'scenarioId',
            'invoiceRefNo',
            'seller_id',
            'byr_id',
            'buyerRegistrationType',
            'sellerNTNCNIC',
            'sellerBusinessName',
            'sellerProvince',
            'sellerAddress',
            'buyerNTNCNIC',
            'buyerProvince',
            'buyerBusinessName',
            'buyerAddress',
            'totalAmountExcludingTax',
            'totalAmountIncludingTax',
            'totalSalesTax',
            'totalfurtherTax',
            'totalextraTax',
            'shipping_charges',
            'other_charges',
            'discount_amount',
            'payment_status',
            'notes',
            'items',
            'invoice_status'
        ]);

        $filteredItems = array_filter($data['items'] ?? [], function ($item) {
            return isset($item['item_id'], $item['quantity'], $item['totalValues']);
        });
        $data['items'] = array_values($filteredItems);
        $request->merge(['items' => $data['items']]);

        $request->validate([
            'invoiceType' => 'required|string',
            'invoiceDate' => 'required|date',
            'seller_id' => 'required|integer|exists:business_configurations,bus_config_id',
            'byr_id' => 'required|integer|exists:buyers,byr_id',
            'buyerRegistrationType' => 'required|string',
            'items.*.item_id' => 'required|integer',
            'items.*.quantity' => 'required|numeric|min:0.01',
            'items.*.totalValues' => 'required|numeric',
            'items.*.valueSalesExcludingST' => 'required|numeric',
            'items.*.SalesTaxApplicable' => 'required|numeric',
            'items.*.SalesTaxWithheldAtSource' => 'required|numeric',
            'items.*.saleType' => 'required|string',
            'items.*.productDescription' => 'required|string',
            'items.*.rate' => 'required|numeric',
            'items.*.uoM' => 'required|string',
        ]);

        DB::beginTransaction();

        try {
            $isDraft = $data['invoice_status'] == 1;

            // Load or create invoice
            if ($id) {
                $invoice = Invoice::findOrFail($id);

                if ($invoice->is_posted_to_fbr) {
                    return back()->with('error', 'You cannot update an invoice that is already posted to FBR.');
                }

                $invoice->fill([
                    'invoice_type' => $data['invoiceType'],
                    'invoice_date' => $data['invoiceDate'],
                    'due_date' => $data['due_date'],
                    'scenario_id' => $data['scenarioId'] ?? null,
                    'invoice_ref_no' => $data['invoiceRefNo'] ?? null,
                    'seller_id' => $data['seller_id'],
                    'buyer_id' => $data['byr_id'],
                    'invoice_status' => $data['invoice_status'] ?? 1,
                    'is_posted_to_fbr' => 0,
                    'totalAmountExcludingTax' => $data['totalAmountExcludingTax'] ?? 0,
                    'totalAmountIncludingTax' => $data['totalAmountIncludingTax'] ?? 0,
                    'totalSalesTax' => $data['totalSalesTax'] ?? 0,
                    'totalfurtherTax' => $data['totalfurtherTax'] ?? 0,
                    'totalextraTax' => $data['totalextraTax'] ?? 0,
                    'shipping_charges' => $data['shipping_charges'] ?? null,
                    'other_charges' => $data['other_charges'] ?? null,
                    'discount_amount' => $data['discount_amount'] ?? null,
                    'payment_status' => $data['payment_status'] ?? null,
                    'notes' => $data['notes'] ?? null,
                ]);
            } else {
                $invoice = Invoice::create([
                    'invoice_type' => $data['invoiceType'],
                    'invoice_date' => $data['invoiceDate'],
                    'due_date' => $data['due_date'],
                    'scenario_id' => $data['scenarioId'] ?? null,
                    'invoice_ref_no' => $data['invoiceRefNo'] ?? null,
                    'seller_id' => $data['seller_id'],
                    'buyer_id' => $data['byr_id'],
                    'invoice_status' => $data['invoice_status'] ?? 1,
                    'is_posted_to_fbr' => 0,
                    'totalAmountExcludingTax' => $data['totalAmountExcludingTax'] ?? 0,
                    'totalAmountIncludingTax' => $data['totalAmountIncludingTax'] ?? 0,
                    'totalSalesTax' => $data['totalSalesTax'] ?? 0,
                    'totalfurtherTax' => $data['totalfurtherTax'] ?? 0,
                    'totalextraTax' => $data['totalextraTax'] ?? 0,
                    'shipping_charges' => $data['shipping_charges'] ?? null,
                    'other_charges' => $data['other_charges'] ?? null,
                    'discount_amount' => $data['discount_amount'] ?? null,
                    'payment_status' => $data['payment_status'] ?? null,
                    'notes' => $data['notes'] ?? null,
                ]);
            }

            $invoice->save();

            if (!$isDraft && !$invoice->invoice_no) {
                $invoice->update([
                    'invoice_no' => 'INV-' . str_pad($invoice->invoice_id, 6, '0', STR_PAD_LEFT)
                ]);
            }

            // Delete old details if editing
            if ($id) {
                InvoiceDetail::where('invoice_id', $invoice->invoice_id)->delete();
            }

            // Insert new items
            foreach ($data['items'] as $item) {
                InvoiceDetail::create([
                    'invoice_id' => $invoice->invoice_id,
                    'item_id' => $item['item_id'],
                    'quantity' => $item['quantity'],
                    'total_value' => $item['totalValues'],
                    'value_excl_tax' => $item['valueSalesExcludingST'],
                    'retail_price' => $item['fixedNotifiedValueOrRetailPrice'] ?? null,
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

            // 🔹 If invoice is being posted, send to FBR
            // if (!$isDraft) {
            //     try {
            //         $fbrPayload = [
            //             'InvoiceNumber' => $invoice->invoice_no,
            //             'InvoiceDate' => $invoice->invoice_date,
            //             'BuyerName' => $invoice->buyer->byr_name,
            //             'BuyerNTN' => $invoice->buyer->byr_ntn_cnic,
            //             'TotalAmount' => $invoice->totalAmountIncludingTax,
            //             'Items' => $data['items'],
            //             // Add other fields as per FBR format
            //         ];

            //         $response = Http::withHeaders([
            //             'Authorization' => 'Bearer ' . env('FBR_API_TOKEN'),
            //             'Content-Type' => 'application/json',
            //         ])->post('https://gw.fbr.gov.pk/di_data/v1/di/postinvoicedata', $fbrPayload);

            //         $responseData = $response->json();

            //         if ($response->successful()) {
            //             $invoice->update([
            //                 'fbr_invoice_number' => $responseData['invoiceNumber'] ?? null,
            //                 'is_posted_to_fbr' => 1,
            //                 'response_status' => $responseData['validationResponse']['status'] ?? 'Success',
            //                 'response_message' => $responseData['validationResponse']['error'] ?? '',
            //             ]);
            //         } else {
            //             throw new \Exception($responseData['message'] ?? 'FBR posting failed');
            //         }
            //     } catch (\Exception $e) {
            //         DB::rollBack();
            //         return back()->with('error', 'Invoice saved but FBR posting failed: ' . $e->getMessage());
            //     }
            // }

            DB::commit();

            return redirect()->route('invoices.index')->with('message', $id ? 'Invoice updated successfully.' : 'Invoice created successfully.');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', 'Error: ' . $e->getMessage());
        }
    }




    public function edit($id)
    {
        $invoiceId = Crypt::decryptString($id);
        $invoice = Invoice::with(['items', 'buyer', 'seller'])->findOrFail($invoiceId);
        $buyers = Buyer::all();
        $items = Item::all();
        $seller = BusinessConfiguration::first();

        return view('invoices.create', compact('invoice', 'buyers', 'items', 'seller'));
    }



    public function print($id)
    {
        $invoiceId = Crypt::decryptString($id);
        $invoice = Invoice::with([
            'buyer',
            'seller',
            'details.item'
        ])->findOrFail($invoiceId);

        return view('invoices.print', compact('invoice'));
    }
}