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
// Route::get('/invoice/print', [XeroController::class, 'print'])->name('invoice.print');
Route::get('/invoice/print/{encryptedId}', [XeroController::class, 'print'])->name('xero.print');

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
    // Route::get('/xero/invoices', [XeroController::class, 'invoices'])->name('xero.invoices');
    Route::get('/xero/invoices/{tenant_id?}', [XeroController::class, 'all_invoices'])->name('xero.all_invoices');


    // Sync Invoice Manually
    Route::get('/xero/select-tenant', [XeroController::class, 'selectTenant'])->name('xero.select_tenant');
    Route::post('/xero/invoices/sync', [XeroController::class, 'syncSelectedTenant'])->name('xero.sync_selected');


    Route::get('/xero/db-invoices', [XeroController::class, 'showInvoicesFromDb'])->name('xero.db_invoices');
    Route::post('/xero/post_to_fbr', [XeroController::class, 'postToFbr'])->name('xero.post_to_fbr');
});

/*
|--------------------------------------------------------------------------
| Auth Routes
|--------------------------------------------------------------------------
*/
require __DIR__ . '/auth.php';