<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Buyer;
use App\Models\Invoice;
use Illuminate\Support\Facades\Cache;
use Carbon\Carbon;
use App\Models\Item;

class DashboardController extends Controller
{
    public function index()
    {  // Get current tenant DB
        // $tenantDb = DB::connection('master')->getDatabaseName();
        $totalClients = Buyer::count();
        $totalInvoices = Invoice::count();
        $fbrPostedInvoices = Invoice::where('is_posted_to_fbr', 1)->count();
        $fbrpostedPercentage = $totalInvoices > 0
            ? round(($fbrPostedInvoices / $totalInvoices) * 100, 2)
            : 0;
        $draftInvoices = Invoice::where('invoice_status', Invoice::STATUS_DRAFT)->count();
        $draftPercentage = $totalInvoices > 0
            ? round(($draftInvoices / $totalInvoices) * 100, 2)
            : 0;
        // Monthly Tax Chart Data
        $monthlyTaxData = Invoice::selectRaw('
            MONTH(invoice_date) as month,
            SUM(totalSalesTax) as totalSalesTax,
            SUM(totalFurtherTax) as totalFurtherTax,
            SUM(totalExtraTax) as totalExtraTax
        ')
            ->whereYear('invoice_date', Carbon::now()->year)
            ->where('is_posted_to_fbr', 1)
            ->groupByRaw('MONTH(invoice_date)')
            ->orderByRaw('MONTH(invoice_date)')
            ->limit(12)
            ->get();
        $monthlyLabels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        $salesTaxData = array_fill(0, 12, 0);
        $furtherTaxData = array_fill(0, 12, 0);
        $extraTaxData = array_fill(0, 12, 0);
        foreach ($monthlyTaxData as $data) {
            $index = $data->month - 1;
            $salesTaxData[$index] = (float) $data->totalSalesTax;
            $furtherTaxData[$index] = (float) $data->totalFurtherTax;
            $extraTaxData[$index] = (float) $data->totalExtraTax;
        }
        // Monthly Draft & Posted Chart Data
        $monthlyInvoiceStatusData = Invoice::selectRaw('
            MONTH(invoice_date) as month,
            SUM(CASE WHEN invoice_status = ? THEN 1 ELSE 0 END) as draft_count,
            SUM(CASE WHEN invoice_status = ? THEN 1 ELSE 0 END) as posted_count
        ', [Invoice::STATUS_DRAFT, Invoice::STATUS_POSTED])
            ->whereYear('invoice_date', Carbon::now()->year)
            ->groupByRaw('MONTH(invoice_date)')
            ->orderByRaw('MONTH(invoice_date)')
            ->limit(12)
            ->get();
        $monthlyDraftCounts = array_fill(0, 12, 0);
        $monthlyPostedCounts = array_fill(0, 12, 0);
        foreach ($monthlyInvoiceStatusData as $data) {
            $index = $data->month - 1;
            $monthlyDraftCounts[$index] = (int) $data->draft_count;
            $monthlyPostedCounts[$index] = (int) $data->posted_count;
        }
        // Total Amount Excluding Tax
        $topClients = Buyer::select('byr_id', 'byr_name')
            ->withSum(['invoices as total' => function ($query) {
                $query->where('is_posted_to_fbr', 1);
            }], 'totalAmountExcludingTax')
            ->having('total', '>', 0)
            ->orderByDesc('total')
            ->limit(5)
            ->get();
        $topClientNames = $topClients->pluck('byr_name');
        $topClientTotals = $topClients->pluck('total');
        $totalSum = $topClientTotals->sum();
        $topClientPercentages = $topClientTotals->map(function ($val) use ($totalSum) {
            return $totalSum > 0 ? round(($val / $totalSum) * 100, 2) : 0;
        });
        // Monthly Top 5 Clients Ranked by Sales Tax Generated
        // $topClients = Buyer::select('buyers.byr_id', 'buyers.byr_name')
        //     ->join('invoices', 'invoices.buyer_id', '=', 'buyers.byr_id')
        //     ->where('invoices.is_posted_to_fbr', 1)
        //     ->groupBy('buyers.byr_id', 'buyers.byr_name')
        //     ->selectRaw('SUM(invoices.totalSalesTax) as total_sales_tax')
        //     ->orderByDesc('total_sales_tax')
        //     ->limit(5)
        //     ->get();
        // $months = collect(range(1, 12))->map(function ($month) {
        //     return Carbon::create()->month($month)->format('M');
        // });
        // $data = [];
        // foreach ($topClients as $client) {
        //     $monthlyData = Invoice::selectRaw('MONTH(invoice_date) as month, SUM(totalSalesTax) as total')
        //         ->where('buyer_id', $client->byr_id)
        //         ->where('invoices.is_posted_to_fbr', 1)
        //         ->groupByRaw('MONTH(invoice_date)')
        //         ->pluck('total', 'month');
        //     $monthlySales = [];
        //     for ($m = 1; $m <= 12; $m++) {
        //         $monthlySales[] = round($monthlyData[$m] ?? 0, 2);
        //     }
        //     $data[] = [
        //         'name' => $client->byr_name,
        //         'data' => $monthlySales,
        //     ];
        // }
        // $topClientsSalesTaxMonthly = [
        //     'months' => $months,
        //     'series' => $data,
        // ];
        // Monthly labels (Jan, Feb, ... Dec)
        $months = collect(range(1, 12))->map(function ($month) {
            return Carbon::create()->month($month)->format('M');
        });

        // Query invoices per month
        $monthlyInvoicesCreated = Invoice::selectRaw('MONTH(invoice_date) as month, COUNT(*) as total')
            ->groupByRaw('MONTH(invoice_date)')
            ->pluck('total', 'month');

        // Query FBR posted invoices per month
        $monthlyInvoicesFbrPosted = Invoice::selectRaw('MONTH(invoice_date) as month, COUNT(*) as total')
            ->where('is_posted_to_fbr', 1)
            ->groupByRaw('MONTH(invoice_date)')
            ->pluck('total', 'month');

        // Build dataset
        $createdData = [];
        $fbrData = [];

        for ($m = 1; $m <= 12; $m++) {
            $createdData[] = (int) ($monthlyInvoicesCreated[$m] ?? 0);
            $fbrData[]     = (int) ($monthlyInvoicesFbrPosted[$m] ?? 0);
        }

        $invoiceMonthlyStats = [
            'months' => $months,
            'series' => [
                [
                    'name' => 'Total Invoices Created',
                    'data' => $createdData,
                ],
                [
                    'name' => 'FBR Posted Invoices',
                    'data' => $fbrData,
                ],
            ],
        ];

        // End Monthly Top 5 Clients Ranked by Sales Tax Generated

        // Start Leading Top Five Clients Services for Revenue
        $topServicesRevenue = Item::select('items.item_id', 'items.item_description')
            ->join('invoice_details', 'invoice_details.item_id', '=', 'items.item_id')
            ->join('invoices', 'invoices.invoice_id', '=', 'invoice_details.invoice_id')
            ->where('invoices.is_posted_to_fbr', 1)
            ->groupBy('items.item_id', 'items.item_description')
            ->selectRaw('SUM(invoice_details.total_value) as total_revenue')
            ->orderByDesc('total_revenue')
            ->limit(5)
            ->get();

        // Extract service names and totals
        $topServiceNamesRevenue = $topServicesRevenue->pluck('item_description');
        $topServiceTotalsRevenue = $topServicesRevenue->pluck('total_revenue')->map(fn($v) => (float)$v);

        // Calculate percentages
        $totalRevenueSum = $topServiceTotalsRevenue->sum();
        $topServicePercentagesRevenue = $topServiceTotalsRevenue->map(function ($val) use ($totalRevenueSum) {
            return $totalRevenueSum > 0 ? round(($val / $totalRevenueSum) * 100, 2) : 0;
        });
        // End Leading Top Five Clients Services for Revenue
        return view('dashboard', compact(
            'totalClients',
            'totalInvoices',
            'fbrPostedInvoices',
            'fbrpostedPercentage',
            'draftInvoices',
            'draftPercentage',
            'salesTaxData',
            'furtherTaxData',
            'extraTaxData',
            'monthlyLabels',
            'monthlyDraftCounts',
            'monthlyPostedCounts',
            'topClientNames',
            'topClientTotals',
            'topClientPercentages',
            'topServiceNamesRevenue',
            'topServiceTotalsRevenue',
            'topServicePercentagesRevenue',
            'invoiceMonthlyStats',
        ));
    }
}