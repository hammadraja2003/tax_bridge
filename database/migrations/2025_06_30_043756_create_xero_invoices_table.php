<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('xero_invoices', function (Blueprint $table) {
            $table->id();
            $table->uuid('invoice_id')->unique();
            $table->string('type');
            $table->string('invoice_number');
            $table->string('reference')->nullable();
            $table->string('status');
            $table->string('currency_code')->nullable();
            $table->float('sub_total')->nullable();
            $table->float('total_tax')->nullable();
            $table->float('total')->nullable();
            $table->float('amount_due')->nullable();
            $table->float('amount_paid')->nullable();
            $table->float('amount_credited')->nullable();
            $table->boolean('is_discounted')->default(false);
            $table->boolean('has_attachments')->default(false);
            $table->dateTime('date')->nullable();
            $table->dateTime('due_date')->nullable();
            $table->dateTime('updated_date_utc')->nullable();
            $table->string('fbr_invoice_number')->nullable();
            $table->boolean('posted_to_fbr')->default(false);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('xero_invoices');
    }
};