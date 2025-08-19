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
    public function generateHash(): string
    {
        $fields = [
            'invoice_no',
            'invoice_type',
            'invoice_date',
            'due_date',
            'scenario_id',
            'invoice_ref_no',
            'seller_id',
            'buyer_id',
            'fbr_invoice_number',
            'is_posted_to_fbr',
            'invoice_status',
            'response_status',
            'response_message',
            'totalAmountExcludingTax',
            'totalAmountIncludingTax',
            'totalSalesTax',
            'totalfurtherTax',
            'totalextraTax',
            'shipping_charges',
            'other_charges',
            'discount_amount',
            'payment_status',
            'notes',
            'qr_code',
        ];

        $data = [];
        foreach ($fields as $field) {
            $val = $this->$field;

            // Normalize null → ''
            if (is_null($val)) {
                $val = '';
            }

            // Normalize dates
            if ($val instanceof \Carbon\Carbon) {
                $val = $val->format('Y-m-d');
            }

            // Normalize numbers
            if (is_numeric($val)) {
                $val = number_format((float)$val, 2, '.', '');
            }

            $data[$field] = (string) $val;
        }

        return hash(
            'sha256',
            json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES)
        );
    }
    // 🚨 Check if tampered
    public function isTampered(): bool
    {
        return $this->generateHash() !== $this->hash;
    }

    // 🔄 Automatically update hash on create/update
    protected static function booted()
    {
        static::saving(function (self $invoice) {
            $newHash = $invoice->generateHash();
            if ($invoice->hash !== $newHash) {
                $invoice->hash = $newHash;
            }
        });
    }
}