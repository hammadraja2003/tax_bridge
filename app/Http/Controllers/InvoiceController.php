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

    public function createNewInvoice(Request $request)
    {
        // Clean incoming data
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
            'items',
        ]);

        // Filter incomplete items
        $filteredItems = array_filter($data['items'] ?? [], function ($item) {
            return isset($item['item_id'], $item['quantity'], $item['totalValues']);
        });

        $data['items'] = array_values($filteredItems); // Reindex
        $request->merge(['items' => $data['items']]); // Update request

        // Validate fields
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
            // Create invoice
            $invoice = Invoice::create([
                'invoice_type' => $data['invoiceType'],
                'invoice_date' => $data['invoiceDate'],
                'invoice_no' => 'INV-' . now()->format('YmdHis'),
                'due_date' => $data['due_date'],
                'scenario_id' => $data['scenarioId'] ?? null,
                'invoice_ref_no' => $data['invoiceRefNo'] ?? null,
                'seller_id' => $data['seller_id'],
                'buyer_id' => $data['byr_id'],
                'is_posted_to_fbr' => 0,
                'totalAmountExcludingTax' => $data['totalAmountExcludingTax'] ?? 0,
                'totalAmountIncludingTax' => $data['totalAmountIncludingTax'] ?? 0,
                'totalSalesTax' => $data['totalSalesTax'] ?? 0,
                'totalfurtherTax' => $data['totalfurtherTax'] ?? 0,
                'totalextraTax' => $data['totalextraTax'] ?? 0,
            ]);

            $invoice->update([
                'invoice_no' => 'INV-' . str_pad($invoice->invoice_id, 6, '0', STR_PAD_LEFT)
            ]);

            // Insert each item
            foreach ($data['items'] as $item) {
                InvoiceDetail::create([
                    'invoice_id' => $invoice->invoice_id,
                    'item_id' => $item['item_id'],
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

            // Optional: Send to FBR (if enabled)
            // $responseData = Http::withHeaders([
            //     'Authorization' => 'Bearer YOUR_TOKEN',
            //     'Content-Type' => 'application/json',
            // ])->post('https://gw.fbr.gov.pk/di_data/v1/di/postinvoicedata', [...]);

            $invoice->update([
                'fbr_invoice_number' => $responseData['invoiceNumber'] ?? null,
                'is_posted_to_fbr' => 1,
                'response_status' => $responseData['validationResponse']['status'] ?? 'Unknown',
                'response_message' => $responseData['validationResponse']['error'] ?? '',
            ]);

            DB::commit();

            return redirect()->route('invoices.index')->with('message', 'Invoice successfully created.');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', 'Error: ' . $e->getMessage());
        }
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