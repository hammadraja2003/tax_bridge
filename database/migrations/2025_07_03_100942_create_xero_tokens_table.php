<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // database/migrations/xxxx_xx_xx_create_xero_tokens_table.php
        Schema::create('xero_tokens', function (Blueprint $table) {
            $table->id();
            $table->uuid('tenant_id')->unique();
            $table->string('tenant_name')->nullable();
            $table->string('tenant_type')->nullable();
            $table->uuid('organisation_id')->nullable();
            $table->text('access_token');
            $table->text('refresh_token');
            $table->dateTime('expires_at')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('xero_tokens');
    }
};