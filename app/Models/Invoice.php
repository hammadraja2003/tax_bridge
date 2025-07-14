<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Invoice extends Model
{
    use HasFactory;

    protected $primaryKey = 'invoice_id';

    protected $fillable = [
        'invoice_type',
        'invoice_date',
        'due_date',
        'invoice_no',
        'scenario_id',
        'invoice_ref_no',
        'seller_id',
        'buyer_id',
        'fbr_invoice_number',
        'is_posted_to_fbr',
        'response_status',
        'response_message',
        'totalAmountExcludingTax',
        'totalAmountIncludingTax',
        'totalSalesTax',
        'totalfurtherTax',
        'totalextraTax',

        // Newly added fields
        'invoice_status',
        'shipping_charges',
        'other_charges',
        'discount_amount',
        'payment_status',
        'notes',
    ];

    // 🧾 Relationships
    public function buyer()
    {
        return $this->belongsTo(Buyer::class, 'buyer_id', 'byr_id');
    }

    public function seller()
    {
        return $this->belongsTo(BusinessConfiguration::class, 'seller_id', 'bus_config_id');
    }

    public function details()
    {
        return $this->hasMany(InvoiceDetail::class, 'invoice_id', 'invoice_id');
    }
    public function items()
    {
        return $this->hasMany(\App\Models\InvoiceDetail::class, 'invoice_id', 'invoice_id');
    }
}