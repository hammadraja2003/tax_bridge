<?php

// database/migrations/xxxx_xx_xx_create_xero_invoice_items_table.php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateXeroInvoiceItemsTable extends Migration
{
    public function up()
    {
        Schema::create('xero_invoice_items', function (Blueprint $table) {
            $table->id();
            $table->uuid('invoice_id'); // Xero invoice ID (foreign key)
            $table->text('description')->nullable(); // allows large strings
            $table->decimal('quantity', 12, 4)->nullable();
            $table->decimal('unit_amount', 18, 4)->nullable();
            $table->decimal('line_amount', 18, 4)->nullable();
            $table->string('item_code')->nullable();
            $table->decimal('tax_amount', 18, 4)->nullable();
            $table->timestamps();

            $table->foreign('invoice_id')->references('invoice_id')->on('xero_invoices')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('xero_invoice_items');
    }
}