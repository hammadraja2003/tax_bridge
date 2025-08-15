<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\InvoiceController;
use App\Http\Controllers\BuyerController;
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\ItemController;
use App\Http\Controllers\ActivityLogController;
use App\Http\Controllers\DashboardController;
use Illuminate\Support\Facades\Crypt;

// use SimpleSoftwareIO\QrCode\Facades\QrCode;
/*
|--------------------------------------------------------------------------
| Public Routes
|--------------------------------------------------------------------------
*/

Route::get('/', function () {
    return view('welcome');
});

// Route::get('/test-qr', function () {
//     $qrData = 'This is my QR test text';
//     $qrFileName = 'qr_test_' . time() . '.png';
//     $qrPath = public_path('uploads/qr_codes/' . $qrFileName);

//     // Ensure folder exists
//     if (!file_exists(public_path('uploads/qr_codes'))) {
//         mkdir(public_path('uploads/qr_codes'), 0755, true);
//     }

//     // Generate and save QR
//     QrCode::format('png')
//         ->size(200)
//         ->generate($qrData, $qrPath);

//     return "QR saved at: uploads/qr_codes/{$qrFileName}";
// });


/*
|--------------------------------------------------------------------------
| Authenticated Routes
|--------------------------------------------------------------------------
*/
Route::middleware(['auth', 'verified', 'security.headers'])->group(function () {

    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    // Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    Route::get('/update-profile/{id}', [ProfileController::class, 'edit_profile'])->name('edit-profile');
    Route::post('/update-profile/{id}', [ProfileController::class, 'update_user_profile'])->name('update-profile');
    //Company OR Bussiness Configuration
    Route::get('/company/configuration', [CompanyController::class, 'index'])->name('company.configuration');
    Route::post('/company/configuration', [CompanyController::class, 'storeOrUpdate'])->name('company.configuration.save');
    //Invoices
    Route::get('/invoices', [InvoiceController::class, 'index'])->name('invoices.index');
    Route::post('/invoices/filter', [InvoiceController::class, 'filter'])->name('invoices.filter');
    Route::get('/invoices/create', [InvoiceController::class, 'create'])->name('invoices.create');
    Route::get('/invoices/print/{id}', [InvoiceController::class, 'print'])->name('xero.print');
    Route::post('/invoicedddd', [InvoiceController::class, 'storeOrUpdate'])->name('create-new-invoice');
    Route::get('/invoices/{invoice}/edit', [InvoiceController::class, 'edit'])->name('invoices.edit');
    Route::put('/invoice/{id}', [InvoiceController::class, 'storeOrUpdate'])->name('invoice.update');
    //Excel Import
    Route::get('/invoices/import', [InvoiceController::class, 'showForm'])->name('invoices.import.form');
    Route::post('/invoices/import', [InvoiceController::class, 'importInvoice'])->name('invoices.import.process');


    //Buyers
    Route::get('/buyers', [BuyerController::class, 'index'])->name('buyers.index');
    Route::get('/buyer/create', [BuyerController::class, 'create'])->name('buyer.create');
    Route::post('/buyers/store', [BuyerController::class, 'store'])->name('buyers.store');
    Route::get('/buyers/edit/{id}', [BuyerController::class, 'edit'])->name('buyers.edit');
    Route::post('/buyers/update/{id}', [BuyerController::class, 'update'])->name('buyers.update');
    Route::delete('/buyers/delete/{id}', [BuyerController::class, 'delete'])->name('buyers.delete');
    Route::get('/buyers/fetch/{id}', [BuyerController::class, 'fetch'])->name('buyers.fetch');


    //Items
    Route::get('/items', [ItemController::class, 'index'])->name('items.index');
    Route::get('/items/create', [ItemController::class, 'create'])->name('items.create');
    Route::post('/items/store', [ItemController::class, 'store'])->name('items.store');
    Route::get('/items/edit/{id}', [ItemController::class, 'edit'])->name('items.edit');
    Route::post('/items/update/{id}', [ItemController::class, 'update'])->name('items.update');
    Route::delete('/items/delete/{id}', [ItemController::class, 'delete'])->name('items.delete');


    Route::get('/activity-logs', [ActivityLogController::class, 'index'])
        ->name('activity.logs')
        ->middleware('auth');
});
/*
|--------------------------------------------------------------------------
| Auth Routes
|--------------------------------------------------------------------------
*/
require __DIR__ . '/auth.php';