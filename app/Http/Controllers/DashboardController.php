<?php

namespace App\Http\Controllers;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        // Total clients (optional month-based filtering can be added)
        $totalClients = DB::table('buyers')->count();
        // Total invoices
        $totalInvoices = DB::table('invoices')->count();
        // Total FBR Posted invoices
        $fbrPostedInvoices = DB::table('invoices')
            ->where('is_posted_to_fbr', 1)
            ->count();
        // Calculate % of unposted invoices
        $fbrUnpostedPercentage = 0;
        if ($totalInvoices > 0) {
            $unposted = $totalInvoices - $fbrPostedInvoices;
            $fbrUnpostedPercentage = round(($unposted / $totalInvoices) * 100, 2);
        }
        if ($fbrUnpostedPercentage == 0) {
            $fbrUnpostedPercentage = 100;
        }

        // Draft invoices count (invoice_status = 1)
        $draftInvoices = DB::table('invoices')
            ->where('invoice_status', 1)
            ->count();

        // Draft percentage of total
        $draftPercentage = 0;
        if ($totalInvoices > 0) {
            $draftPercentage = round(($draftInvoices / $totalInvoices) * 100, 2);
        }

        $monthlyTaxData = DB::table('invoices')
                ->selectRaw('
                    MONTH(invoice_date) as month,
                    SUM(totalSalesTax) as totalSalesTax,
                    SUM(totalFurtherTax) as totalFurtherTax,
                    SUM(totalExtraTax) as totalExtraTax
                ')
                ->whereYear('invoice_date', now()->year)
                ->groupBy(DB::raw('MONTH(invoice_date)'))
                ->orderBy(DB::raw('MONTH(invoice_date)'))
                ->get();

            // Prepare array for chart
            $monthlyLabels = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
            $salesTaxData = array_fill(0, 12, 0);
            $furtherTaxData = array_fill(0, 12, 0);
            $extraTaxData = array_fill(0, 12, 0);

            foreach ($monthlyTaxData as $data) {
                $index = $data->month - 1;
                $salesTaxData[$index] = (float) $data->totalSalesTax;
                $furtherTaxData[$index] = (float) $data->totalFurtherTax;
                $extraTaxData[$index] = (float) $data->totalExtraTax;
            }
            // End Graph Tax
            
            $monthlyInvoiceStatusData = DB::table('invoices')
                ->selectRaw('
                    MONTH(invoice_date) as month,
                    SUM(CASE WHEN invoice_status = 1 THEN 1 ELSE 0 END) as draft_count,
                    SUM(CASE WHEN invoice_status = 2 THEN 1 ELSE 0 END) as posted_count
                ')
                ->whereYear('invoice_date', now()->year)
                ->groupBy(DB::raw('MONTH(invoice_date)'))
                ->orderBy(DB::raw('MONTH(invoice_date)'))
                ->get();

            // Step 2: Initialize arrays
            $monthlyDraftCounts = array_fill(0, 12, 0);
            $monthlyPostedCounts = array_fill(0, 12, 0);

            // Step 3: Fill arrays
            foreach ($monthlyInvoiceStatusData as $data) {
                $index = $data->month - 1;
                $monthlyDraftCounts[$index] = (int) $data->draft_count;
                $monthlyPostedCounts[$index] = (int) $data->posted_count;
            }
            // End Draft and Posted

            return view('dashboard', compact(
                'totalClients',
                'totalInvoices',
                'fbrPostedInvoices',
                'fbrUnpostedPercentage',
                'draftInvoices',
                'draftPercentage',
                'salesTaxData',
                'furtherTaxData',
                'extraTaxData',
                'monthlyLabels',
                'monthlyDraftCounts',
                'monthlyPostedCounts'
            ));
    }


}
