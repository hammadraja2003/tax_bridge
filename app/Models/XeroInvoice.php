<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class XeroInvoice extends Model
{
    protected $fillable = [
        'invoice_id',
        'type',
        'invoice_number',
        'reference',
        'status',
        'currency_code',
        'sub_total',
        'total_tax',
        'total',
        'amount_due',
        'amount_paid',
        'amount_credited',
        'is_discounted',
        'has_attachments',
        'date',
        'due_date',
        'updated_date_utc',
        'fbr_invoice_number',
        'posted_to_fbr'
    ];

    protected $casts = [
        'is_discounted' => 'boolean',
        'has_attachments' => 'boolean',
        'posted_to_fbr' => 'boolean',
        'date' => 'datetime',
        'due_date' => 'datetime',
        'updated_date_utc' => 'datetime',
    ];
}