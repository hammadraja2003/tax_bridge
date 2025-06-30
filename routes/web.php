<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\XeroController;


Route::get('/xero/connect', [XeroController::class, 'connect'])->name('xero.connect');
//hammad.ali@f3technologies.eu
//Feb@2024
Route::get('/xero/callback', [XeroController::class, 'callback'])->name('xero.callback');
Route::get('/xero/invoices', [XeroController::class, 'invoices'])->name('xero.invoices');
// Route::get('/xero/get-xero-items', [XeroController::class, 'getXeroItems'])->name('xero.xero-items');

Route::get('/xero/db-invoices', [XeroController::class, 'showInvoicesFromDb'])->name('xero.db_invoices');
Route::post('/xero/post-to-fbr', [XeroController::class, 'postToFbr'])->name('xero.post_to_fbr');

// Disconnect route
Route::get('/xero/disconnect', function () {
    session()->forget('xero_token');
    return redirect('/xero/connect')->with('success', 'Xero disconnected. Please reconnect.');
})->name('xero.disconnect');

// Route to show any error messages
Route::get('/xero/error', function () {
    return view('xero.error');
})->name('xero.error');