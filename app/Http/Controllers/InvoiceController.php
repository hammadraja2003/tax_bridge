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
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Validator;
use App\Services\FbrInvoiceService;
use Illuminate\Support\Facades\Log;
use SimpleSoftwareIO\QrCode\Facades\QrCode;

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
        // 🔎 Filter by invoice type
        if ($request->filled('invoice_type')) {
            $query->where('invoice_type', trim($request->invoice_type));
        }
        // 📅 Filter by date range
        if ($request->filled('date_from') && $request->filled('date_to')) {
            $query->whereBetween('invoice_date', [
                $request->date_from,
                $request->date_to
            ]);
        } elseif ($request->filled('date_from')) {
            $query->whereDate('invoice_date', '>=', $request->date_from);
        } elseif ($request->filled('date_to')) {
            $query->whereDate('invoice_date', '<=', $request->date_to);
        }
        // ✅ Filter by FBR posting status
        if ($request->has('is_posted_to_fbr') && $request->is_posted_to_fbr !== '') {
            $query->where('is_posted_to_fbr', $request->is_posted_to_fbr);
        }
        // Fetch with latest invoice_date
        $invoices = $query->orderByDesc('invoice_date')->paginate(10);
        foreach ($invoices as $invoice) {
            // Header tampering
            $invoice->tampered = $invoice->isTampered();
            // Details tampering
            $tamperedLines = false;
            foreach ($invoice->details as $detail) {
                $recalculated = $detail->generateHash();
            }
            $invoice->tampered_lines = $tamperedLines;
        }
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
    public function storeOrUpdate(Request $request, $id = null)
    {
        // Allow script to run up to 120 seconds
        set_time_limit(120);
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
            'SalesTaxApplicable',
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
        // Filter out invalid items
        $filteredItems = array_filter($data['items'] ?? [], function ($item) {
            return isset($item['item_id'], $item['quantity'], $item['totalValues']);
        });
        $data['items'] = array_values($filteredItems);
        $request->merge(['items' => $data['items']]);
        // Validation
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
            'items.*.rate' => 'required|string',
            'items.*.uoM' => 'required|string',
        ]);
        DB::beginTransaction();
        try {
            $isDraft = $data['invoice_status'] == 1;
            $invoice = $id ? Invoice::findOrFail($id) : new Invoice();
            if ($id && $invoice->is_posted_to_fbr) {
                return back()->with('error', 'You cannot update an invoice that is already posted to FBR.');
            }
            // Save main invoice
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
            $invoice->save();
            if (!$isDraft && !$invoice->invoice_no) {
                $invoice->update([
                    'invoice_no' => 'INV-' . str_pad($invoice->invoice_id, 6, '0', STR_PAD_LEFT)
                ]);
            }
            // Save invoice items
            if ($id) {
                InvoiceDetail::where('invoice_id', $invoice->invoice_id)->delete();
            }
            foreach ($data['items'] as $item) {
                InvoiceDetail::create([
                    'invoice_id' => $invoice->invoice_id,
                    'item_id' => $item['item_id'],
                    'quantity' => $item['quantity'],
                    'total_value' => $item['totalValues'],
                    'value_excl_tax' => $item['valueSalesExcludingST'],
                    'retail_price' => $item['fixedNotifiedValueOrRetailPrice'] ?? 0,
                    'sales_tax_applicable' => $item['SalesTaxApplicable'],
                    'sales_tax_withheld' => $item['SalesTaxWithheldAtSource'],
                    'extra_tax' => $item['extraTax'] ?? 0,
                    'further_tax' => $item['furtherTax'] ?? 0,
                    'fed_payable' => $item['fedPayable'] ?? 0,
                    'discount' => $item['discount'] ?? 0,
                    'sale_type' => $item['saleType'],
                    'sro_schedule_no' => $item['sroScheduleNo'] ?? '',
                    'sro_item_serial_no' => $item['sroItemSerialNo'] ?? '',
                ]);
            }
            // FBR posting if not draft
            if (!$isDraft) {
                $fbrPayload = [
                    'invoiceType' => $data['invoiceType'] === 'Sales Invoice' ? 'Sale Invoice' : $data['invoiceType'],
                    'invoiceDate' => $data['invoiceDate'],
                    'sellerNTNCNIC' => preg_replace('/\D/', '', $data['sellerNTNCNIC']), // remove non-digits
                    'sellerBusinessName' => $data['sellerBusinessName'],
                    'sellerProvince' => $data['sellerProvince'],
                    'sellerAddress' => $data['sellerAddress'],
                    'buyerNTNCNIC' => (string) $data['buyerNTNCNIC'] ?? '',
                    'buyerBusinessName' => $data['buyerBusinessName'],
                    'buyerProvince' => $data['buyerProvince'],
                    'buyerAddress' => $data['buyerAddress'],
                    'buyerRegistrationType' => $data['buyerRegistrationType'],
                    'invoiceRefNo' => $data['invoiceRefNo'] ?? '',
                    'scenarioId' => $data['scenarioId'],
                    'items' => array_map(function ($item) {
                        return [
                            'hsCode' => $item['hsCode'],
                            'productDescription' => $item['productDescription'],
                            'rate' => str_ends_with($item['rate'], '%') ? $item['rate'] : $item['rate'] . '%',
                            'uoM' => $item['uoM'],
                            'quantity' => (int) $item['quantity'],
                            'totalValues' => (float) $item['totalValues'],
                            'valueSalesExcludingST' => (float) $item['valueSalesExcludingST'],
                            'fixedNotifiedValueOrRetailPrice' => (float) $item['fixedNotifiedValueOrRetailPrice'],
                            'salesTaxApplicable' => (float) ($item['SalesTaxApplicable'] ?? 0),
                            'salesTaxWithheldAtSource' => (float) ($item['SalesTaxWithheldAtSource'] ?? 0),
                            'extraTax' =>  $item['extraTax'] ?? '',
                            'furtherTax' => (float) $item['furtherTax'],
                            'sroScheduleNo' => $item['sroScheduleNo'] ?? '',
                            'fedPayable' => (float) $item['fedPayable'],
                            'discount' => (float) $item['discount'],
                            'saleType' => $item['saleType'],
                            'sroItemSerialNo' => $item['sroItemSerialNo'] ?? '',
                        ];
                    }, $data['items']),
                ];
                $fbrService = new FbrInvoiceService(env('FBR_ENV', 'sandbox'));
                // Step 1: Validate
                $validation = $fbrService->validateInvoice($fbrPayload);
                if (!$validation['success']) {
                    $errorMessage = $validation['error']
                        ?? ($validation['data']['validationResponse']['error'] ?? null);
                    // If still empty, check invoiceStatuses errors
                    if (!$errorMessage && !empty($validation['invoiceStatuses'][0]['error'])) {
                        $errorMessage = $validation['invoiceStatuses'][0]['error'];
                    }
                    throw new \Exception('FBR Validation Failed: ' . ($errorMessage ?: 'Unknown validation error'));
                }
                // Step 2: Post
                $posting = $fbrService->postInvoice($fbrPayload);
                if ($posting['success']) {
                    $invoice->update([
                        'fbr_invoice_number' => $posting['data']['invoiceNumber'] ?? null,
                        'is_posted_to_fbr' => 1,
                        'response_status' => 'Success',
                        'response_message' => 'Posted successfully to FBR ' . strtoupper(env('FBR_ENV', 'sandbox')),
                    ]);
                    // ✅ Log activity
                    logActivity(
                        'update',
                        'Posted invoice to FBR: ' . $invoice->invoice_no,
                        $invoice->toArray(),
                        $invoice->invoice_no,
                        'invoices'
                    );
                    // Generate QR code
                    $qrData = $posting['data']['invoiceNumber']; // Or full JSON if FBR requires
                    $qrFileName = 'qr_' . $invoice->invoice_no . '_' . time() . '.png';
                    $qrPath = public_path('uploads/qr_codes/' . $qrFileName);
                    // Make sure the folder exists
                    if (!file_exists(public_path('uploads/qr_codes'))) {
                        mkdir(public_path('uploads/qr_codes'), 0755, true);
                    }
                    // Generate and save QR
                    QrCode::format('png')
                        ->size(200)
                        ->generate($qrData, $qrPath);
                    // Save QR code filename in invoice
                    $invoice->update([
                        'qr_code' => $qrFileName
                    ]);
                } else {
                    DB::rollBack();
                    throw new \Exception('FBR Posting Failed: ' . $posting['error']);
                }
            }
            DB::commit();
            return redirect()->route('invoices.index')->with('message', $id ? 'Invoice updated successfully.' : 'Invoice created and posted to FBR.');
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
    // public function showForm()
    // {
    //     return view('invoices.import');
    // }
    // public function importInvoice(Request $request)
    // {
    //     $request->validate([
    //         'excel_file' => 'required|file|mimes:xlsx,xls',
    //     ]);
    //     $rows = Excel::toCollection(null, $request->file('excel_file'))->first();
    //     if ($rows->isEmpty()) {
    //         return back()->with('error', 'Excel file is empty.');
    //     }
    //     // Group by invoiceRefNo (one invoice, many items)
    //     $grouped = $rows->groupBy('invoiceRefNo');
    //     $successCount = 0;
    //     $failures = [];
    //     foreach ($grouped as $invoiceRef => $invoiceRows) {
    //         $first = $invoiceRows->first();
    //         // Validate required invoice-level fields
    //         $validator = Validator::make($first->toArray(), [
    //             'invoiceType' => 'required',
    //             'invoiceDate' => 'required|date',
    //             'sellerNTNCNIC' => 'required',
    //             'sellerBusinessName' => 'required',
    //             'sellerProvince' => 'required',
    //             'sellerAddress' => 'required',
    //             'scenarioId' => 'required',
    //         ]);
    //         if ($validator->fails()) {
    //             $failures[] = "InvoiceRef: {$invoiceRef} validation failed: " . implode(", ", $validator->errors()->all());
    //             continue;
    //         }
    //         $invoice = FbrInvoice::create([
    //             'invoice_ref_no' => $invoiceRef,
    //             'invoice_type' => $first['invoiceType'],
    //             'invoice_date' => $first['invoiceDate'],
    //             'seller_ntn_cnic' => $first['sellerNTNCNIC'],
    //             'seller_business_name' => $first['sellerBusinessName'],
    //             'seller_province' => $first['sellerProvince'],
    //             'seller_address' => $first['sellerAddress'],
    //             'buyer_ntn_cnic' => $first['buyerNTNCNIC'],
    //             'buyer_business_name' => $first['buyerBusinessName'],
    //             'buyer_province' => $first['buyerProvince'],
    //             'buyer_address' => $first['buyerAddress'],
    //             'buyer_registration_type' => $first['buyerRegistrationType'],
    //             'scenario_id' => $first['scenarioId'],
    //             'status' => 'draft',
    //         ]);
    //         foreach ($invoiceRows as $row) {
    //             FbrInvoiceItem::create([
    //                 'fbr_invoice_id' => $invoice->id,
    //                 'hs_code' => $row['hsCode'],
    //                 'product_description' => $row['productDescription'],
    //                 'rate' => $row['rate'],
    //                 'uo_m' => $row['uoM'],
    //                 'quantity' => $row['quantity'],
    //                 'total_values' => $row['totalValues'],
    //                 'value_sales_excluding_st' => $row['valueSalesExcludingST'],
    //                 'fixed_notified_value_or_retail_price' => $row['fixedNotifiedValueOrRetailPrice'],
    //                 'sales_tax_applicable' => $row['SalesTaxApplicable'],
    //                 'sales_tax_withheld' => $row['SalesTaxWithheldAtSource'],
    //                 'extra_tax' => $row['extraTax'],
    //                 'further_tax' => $row['furtherTax'],
    //                 'sro_schedule_no' => $row['sroScheduleNo'],
    //                 'fed_payable' => $row['fedPayable'],
    //                 'discount' => $row['discount'],
    //                 'sale_type' => $row['saleType'],
    //                 'sro_item_serial_no' => $row['sroItemSerialNo'],
    //             ]);
    //         }
    //         // Optional: Send to FBR here
    //         $sendNow = true; // Set to false if saving drafts only
    //         if ($sendNow) {
    //             $payload = $invoice->toFbrPayload();
    //             $response = Http::withToken('YOUR_ACCESS_TOKEN')
    //                 ->post('https://sandbox.fbr.gov.pk/api/invoice', $payload);
    //             if ($response->successful()) {
    //                 $invoice->update(['status' => 'sent']);
    //                 $successCount++;
    //             } else {
    //                 $invoice->update(['status' => 'failed']);
    //                 $failures[] = "InvoiceRef {$invoiceRef} failed: " . $response->body();
    //             }
    //         }
    //     }
    //     if ($failures) {
    //         return back()->with('error', "Sent: $successCount, Failed: " . count($failures) . "<br>" . implode("<br>", $failures));
    //     }
    //     return back()->with('success', "$successCount invoice(s) processed and sent.");
    // }
}