<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

// app/Models/XeroToken.php
class XeroToken extends Model
{
    protected $fillable = [
        'tenant_id',
        'tenant_name',
        'tenant_type',
        'organisation_id',
        'access_token',
        'refresh_token',
        'expires_at',
    ];

    protected $dates = ['expires_at'];
}