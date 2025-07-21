<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Buyer;
use App\Models\Invoice;
use Illuminate\Support\Facades\Cache;
use Carbon\Carbon;

class DashboardController extends Controller
{
    public function index()
    {
        // Use caching to reduce DB load (cache for 5 minutes)
        $totalClients = Cache::remember('dashboard.totalClients', 300, fn() => Buyer::count());
        $totalInvoices = Cache::remember('dashboard.totalInvoices', 300, fn() => Invoice::count());
        $fbrPostedInvoices = Cache::remember(
            'dashboard.fbrPostedInvoices',
            300,
            fn() =>
            Invoice::where('is_posted_to_fbr', 1)->count()
        );

        $fbrpostedPercentage = $totalInvoices > 0
            ? round(($fbrPostedInvoices / $totalInvoices) * 100, 2)
            : 0;
        $draftInvoices = Cache::remember(
            'dashboard.draftInvoices',
            300,
            fn() =>
            Invoice::where('invoice_status', Invoice::STATUS_DRAFT)->count()
        );

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
        $topClients = Cache::remember('dashboard.topClients', 300, function () {
            return Buyer::select('byr_id', 'byr_name')
                ->withSum('invoices as total', 'totalAmountExcludingTax')
                ->orderByDesc('total')
                ->limit(5)
                ->get();
        });
        
        $topClientNames = $topClients->pluck('byr_name');
        $topClientTotals = $topClients->pluck('total');
        
        $totalSum = $topClientTotals->sum();
        $topClientPercentages = $topClientTotals->map(function ($val) use ($totalSum) {
            return $totalSum > 0 ? round(($val / $totalSum) * 100, 2) : 0;
        });
        // Sale Tax
        // $topClientsSalesTax = Cache::remember('dashboard.topClientsSalesTax', 300, function () {
        //     return Buyer::select('byr_id', 'byr_name')
        //         ->withSum('invoices as total_sales_tax', 'totalSalesTax')
        //         ->orderByDesc('total_sales_tax')
        //         ->limit(5)
        //         ->get();
        // });
        
        // $topClientNamesSalesTax = $topClientsSalesTax->pluck('byr_name');
        // $topClientTotalsSalesTax = $topClientsSalesTax->pluck('total_sales_tax');
        
        // $totalSalesTaxSum = $topClientTotalsSalesTax->sum();
        // $topClientPercentagesSalesTax = $topClientTotalsSalesTax->map(function ($val) use ($totalSalesTaxSum) {
        //     return $totalSalesTaxSum > 0 ? round(($val / $totalSalesTaxSum) * 100, 2) : 0;
        // });
        ///
        $topClientsSalesTaxMonthly = Cache::remember('dashboard.topClientsSalesTaxMonthly', 300, function () {
            // First: Get Top 5 clients overall
            $topClients = Buyer::select('buyers.byr_id', 'buyers.byr_name')
                ->join('invoices', 'invoices.buyer_id', '=', 'buyers.byr_id')
                ->groupBy('buyers.byr_id', 'buyers.byr_name')
                ->selectRaw('SUM(invoices.totalSalesTax) as total_sales_tax')
                ->orderByDesc('total_sales_tax')
                ->limit(5)
                ->get();
        
            $months = collect(range(1, 12))->map(function ($month) {
                return Carbon::create()->month($month)->format('M');
            });
        
            $data = [];
        
            foreach ($topClients as $client) {
                $monthlyData = Invoice::selectRaw('MONTH(invoice_date) as month, SUM(totalSalesTax) as total')
                    ->where('buyer_id', $client->byr_id)
                    ->groupByRaw('MONTH(invoice_date)')
                    ->pluck('total', 'month');
        
                $monthlySales = [];
        
                for ($m = 1; $m <= 12; $m++) {
                    $monthlySales[] = round($monthlyData[$m] ?? 0, 2);
                }
        
                $data[] = [
                    'name' => $client->byr_name,
                    'data' => $monthlySales,
                ];
            }
        
            return [
                'months' => $months,
                'series' => $data,
            ];
        });
        ///
        $topClientsRevenue = Cache::remember('dashboard.topClientsRevenue', 300, function () {
            return Buyer::select('buyers.byr_id', 'buyers.byr_name')
                ->join('invoices', 'invoices.buyer_id', '=', 'buyers.byr_id')
                ->join('invoice_details', 'invoice_details.invoice_id', '=', 'invoices.invoice_id')
                ->join('items', 'items.item_id', '=', 'invoice_details.item_id')
                ->groupBy('buyers.byr_id', 'buyers.byr_name')
                ->selectRaw('SUM(invoice_details.total_value) as total_revenue')
                ->orderByDesc('total_revenue')
                ->limit(5)
                ->get();
        });
        
        // Extract and convert to float
        $topClientNamesRevenue = $topClientsRevenue->pluck('byr_name');
        $topClientTotalsRevenue = $topClientsRevenue->pluck('total_revenue')->map(fn($v) => (float)$v);
        
        // Calculate percentages
        $totalRevenueSum = $topClientTotalsRevenue->sum();
        $topClientPercentagesRevenue = $topClientTotalsRevenue->map(function ($val) use ($totalRevenueSum) {
            return $totalRevenueSum > 0 ? round(($val / $totalRevenueSum) * 100, 2) : 0;
        });
        
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
            'topClientNamesRevenue',
            'topClientTotalsRevenue',
            'topClientPercentagesRevenue',
            'topClientsSalesTaxMonthly',
        ));
    }
}