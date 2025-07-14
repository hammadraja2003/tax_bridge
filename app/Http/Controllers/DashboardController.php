<?php

namespace App\Http\Controllers;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        // Total clients for current month
        $totalClients = DB::table('buyers')

            ->count();

        // Total invoices
        $totalInvoices = DB::table('invoices')
        ->count();

        // Total FBR Posted invoices this month
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
        return view('dashboard', compact('totalClients', 'totalInvoices','fbrPostedInvoices','fbrUnpostedPercentage'));
    }
}
