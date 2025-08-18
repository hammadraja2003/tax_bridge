<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Invoice extends Model
{
    public const STATUS_DRAFT = 1;
    public const STATUS_POSTED = 2;
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
        'qr_code',
        'hash',
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
    // 🔐 Generate hash (header-level integrity check)
    public function generateHash(): string
    {
        $v = fn($val) => (string)($val ?? ''); // normalize nulls
        return hash('sha256', implode('|', [
            $v($this->invoice_no),
            $v($this->invoice_type),
            $v($this->invoice_date),
            $v($this->due_date),
            $v($this->scenario_id),
            $v($this->invoice_ref_no),
            $v($this->seller_id),
            $v($this->buyer_id),
            $v($this->fbr_invoice_number),
            $v($this->is_posted_to_fbr),
            $v($this->invoice_status),
            $v($this->response_status),
            $v($this->response_message),
            $v($this->totalAmountExcludingTax),
            $v($this->totalAmountIncludingTax),
            $v($this->totalSalesTax),
            $v($this->totalfurtherTax),
            $v($this->totalextraTax),
            $v($this->shipping_charges),
            $v($this->other_charges),
            $v($this->discount_amount),
            $v($this->payment_status),
            $v($this->notes),
            $v($this->qr_code),
        ]));
    }
    public function isTampered(): bool
    {
        return $this->generateHash() !== $this->hash;
    }
    // 🔄 Automatically update hash on create/update
    protected static function booted()
    {
        static::creating(function (self $invoice) {
            $invoice->hash = $invoice->generateHash();
        });
        static::updating(function (self $invoice) {
            $invoice->hash = $invoice->generateHash();
        });
    }
}