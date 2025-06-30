<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('xero_invoices', function (Blueprint $table) {
            $table->uuid('tenant_id')->nullable()->after('id');
            $table->string('tenant_name')->nullable();
            $table->string('tenant_type')->nullable();
            $table->uuid('organisation_id')->nullable();
            $table->timestamp('tenant_created_at')->nullable();
            $table->timestamp('tenant_updated_at')->nullable();
        });
    }

    public function down(): void
    {
        Schema::table('xero_invoices', function (Blueprint $table) {
            $table->dropColumn([
                'tenant_id',
                'tenant_name',
                'tenant_type',
                'organisation_id',
                'tenant_created_at',
                'tenant_updated_at',
            ]);
        });
    }
};