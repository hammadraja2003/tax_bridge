<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\InvoiceController;
use App\Http\Controllers\BuyerController;
use App\Http\Controllers\CompanyController;

/*
|--------------------------------------------------------------------------
| Public Routes
|--------------------------------------------------------------------------
*/

Route::get('/', function () {
    return view('welcome');
});


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

    //Company OR Bussiness Configuration
    Route::get('/company/configuration', [CompanyController::class, 'index'])->name('company.configuration');
    Route::post('/company/configuration', [CompanyController::class, 'storeOrUpdate'])->name('company.configuration.save');


    //Invoices
    Route::get('/invoices', [InvoiceController::class, 'index'])->name('invoices.index');
    Route::get('/invoices/create', [InvoiceController::class, 'create'])->name('invoices.create');
    Route::post('/create-new-invoice', [InvoiceController::class, 'createNewInvoice'])->name('create-new-invoice');

    //Buyers
    Route::get('/buyers', [BuyerController::class, 'index'])->name('buyers.index');
    Route::get('/buyers/create', [BuyerController::class, 'create'])->name('buyers.create');
    Route::post('/buyers/store', [BuyerController::class, 'store'])->name('buyers.store');
    Route::get('/buyers/edit/{id}', [BuyerController::class, 'edit'])->name('buyers.edit');
    Route::post('/buyers/update/{id}', [BuyerController::class, 'update'])->name('buyers.update');
    Route::post('/buyers/delete/{id}', [BuyerController::class, 'delete'])->name('buyers.delete');

    //Items
    Route::get('/items', [ItemController::class, 'index'])->name('items.index');
});

/*
|--------------------------------------------------------------------------
| Auth Routes
|--------------------------------------------------------------------------
*/
require __DIR__ . '/auth.php';