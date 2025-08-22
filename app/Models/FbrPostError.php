<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FbrPostError extends Model
{
    protected $table = 'fbr_post_error';

    public $timestamps = true; 
    protected $guarded = [];
    protected $fillable = [
        'type', 'status_code', 'status', 'error_code', 'error',
        'invoice_statuses', 'raw_response', 'error_time'
    ];
}
