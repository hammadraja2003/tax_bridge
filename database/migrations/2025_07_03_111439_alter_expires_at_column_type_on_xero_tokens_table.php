<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('xero_tokens', function (Blueprint $table) {
            $table->dateTime('expires_at')->nullable()->change();
        });
    }

    public function down(): void
    {
        Schema::table('xero_tokens', function (Blueprint $table) {
            $table->timestamp('expires_at')->nullable()->change(); // Optional rollback
        });
    }
};