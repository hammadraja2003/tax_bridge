<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\XeroController;


Route::get('/xero/connect', [XeroController::class, 'connect'])->name('xero.connect');
Route::get('/xero/callback', [XeroController::class, 'callback'])->name('xero.callback');
Route::get('/xero/invoices', [XeroController::class, 'invoices'])->name('xero.invoices');

Route::get('/xero/db-invoices', [XeroController::class, 'showInvoicesFromDb'])->name('xero.db_invoices');
Route::post('/xero/post-to-fbr', [XeroController::class, 'postToFbr'])->name('xero.post_to_fbr');