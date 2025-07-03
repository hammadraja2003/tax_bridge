<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\XeroController;

/*
|--------------------------------------------------------------------------
| Public Routes
|--------------------------------------------------------------------------
*/

Route::get('/', function () {
    return view('welcome');
});


// Xero error
Route::get('/xero/error', function () {
    return view('xero.error');
})->name('xero.error');

// Additional routes pulled from update
Route::get('/all_invoices', [XeroController::class, 'all_invoices'])->name('xero.all_invoices');
Route::get('/invoice/print', [XeroController::class, 'print'])->name('invoice.print');

/*
|--------------------------------------------------------------------------
| Authenticated Routes
|--------------------------------------------------------------------------
*/

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');

    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');


    // Xero Routes
    Route::get('/xero/connect', [XeroController::class, 'connect'])->name('xero.connect');
    Route::get('/xero/callback', [XeroController::class, 'callback'])->name('xero.callback');
    Route::get('/xero/invoices', [XeroController::class, 'invoices'])->name('xero.invoices');
    Route::get('/xero/db-invoices', [XeroController::class, 'showInvoicesFromDb'])->name('xero.db_invoices');
    Route::post('/xero/post_to_fbr', [XeroController::class, 'postToFbr'])->name('xero.post_to_fbr');

    // Xero disconnect
    // Route::get('/xero/disconnect', function () {
    //     session()->forget('xero_token');
    //     return redirect('/xero/connect')->with('success', 'Xero disconnected. Please reconnect.');
    // })->name('xero.disconnect');
});

/*
|--------------------------------------------------------------------------
| Auth Routes
|--------------------------------------------------------------------------
*/
require __DIR__ . '/auth.php';