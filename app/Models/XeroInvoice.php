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
        'currency_rate',
        'sub_total',
        'total_tax',
        'total',
        'amount_due',
        'amount_paid',
        'amount_credited',
        'is_discounted',
        'has_attachments',
        'line_amount_types',
        'branding_theme_id',
        'url',
        'date',
        'due_date',
        'updated_date_utc',
        'fully_paid_on_date',
        'fbr_invoice_number',
        'posted_to_fbr',
        // 👇 Tenant & org info
        'tenant_id',
        'tenant_name',
        'tenant_type',
        'organisation_id',
        'tenant_created_at',
        'tenant_updated_at',
    ];

    protected $casts = [
        'is_discounted' => 'boolean',
        'has_attachments' => 'boolean',
        'posted_to_fbr' => 'boolean',
        'date' => 'datetime',
        'due_date' => 'datetime',
        'updated_date_utc' => 'datetime',
        'fully_paid_on_date' => 'datetime',
        'tenant_created_at' => 'datetime',
        'tenant_updated_at' => 'datetime',
        'currency_rate' => 'float',
    ];
    public function items()
    {
        return $this->hasMany(XeroInvoiceItem::class, 'invoice_id', 'invoice_id');
    }
}