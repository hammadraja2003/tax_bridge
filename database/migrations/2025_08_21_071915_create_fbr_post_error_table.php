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
        Schema::create('fbr_post_error', function (Blueprint $table) {
           $table->id();
            $table->string('type')->comment('validation | posting'); 
            $table->string('status_code')->nullable();
            $table->string('status')->nullable();
            $table->string('error_code')->nullable();
            $table->text('error')->nullable();
            $table->json('invoice_statuses')->nullable(); // array save karne k liye
            $table->json('raw_response')->nullable(); // pura json store for debugging
            $table->timestamp('error_time')->useCurrent();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('fbr_post_error');
    }
};
