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
        $topClients = Cache::remember('dashboard.topClients', 300, function () {
            return Buyer::withSum('invoices as total', 'totalAmountExcludingTax')
                ->orderByDesc('total')
                ->take(5)
                ->get(['byr_id', 'byr_name']); 
        });
    
        $topClientNames = $topClients->pluck('byr_name');
        $topClientTotals = $topClients->pluck('total');

        $filteredClients = $topClients->filter(function ($client) {
            return !is_null($client->total);
        });
        $topClientNames = $filteredClients->pluck('byr_name')->values();
        $topClientTotals = $filteredClients->pluck('total')->values();
    
        $totalSum = $topClientTotals->sum();
        $topClientPercentages = $topClientTotals->map(function ($val) use ($totalSum) {
            return $totalSum > 0 ? round(($val / $totalSum) * 100, 2) : 0;
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
            'topClientPercentages'
        ));
    }
}