<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class InvoiceDetail extends Model
{
    use HasFactory;
    protected $primaryKey = 'invoice_detail_id';
    protected $fillable = [
        'invoice_id',
        'item_id',
        'quantity',
        'total_value',
        'value_excl_tax',
        'retail_price',
        'sales_tax_applicable',
        'sales_tax_withheld',
        'extra_tax',
        'further_tax',
        'fed_payable',
        'discount',
        'sale_type',
        'sro_schedule_no',
        'sro_item_serial_no',
        'hash',
    ];
    // 🔗 Relationships
    public function invoice()
    {
        return $this->belongsTo(Invoice::class, 'invoice_id', 'invoice_id');
    }
    public function item()
    {
        return $this->belongsTo(Item::class, 'item_id', 'item_id');
    }
    public function generateHash(): string
    {
        $v = function ($val) {
            if (is_null($val)) return '';
            if (is_numeric($val)) return number_format((float)$val, 2, '.', '');
            return trim((string)$val);
        };
        return hash('sha256', implode('|', [
            $v($this->invoice_id),
            $v($this->item_id),
            $v($this->quantity),
            $v($this->total_value),
            $v($this->value_excl_tax),
            $v($this->retail_price),
            $v($this->sales_tax_applicable),
            $v($this->sales_tax_withheld),
            $v($this->extra_tax),
            $v($this->further_tax),
            $v($this->fed_payable),
            $v($this->discount),
            $v($this->sale_type),
            $v($this->sro_schedule_no),
            $v($this->sro_item_serial_no),
        ]));
    }
    public function isTampered(): bool
    {
        return $this->generateHash() !== $this->hash;
    }
    protected static function booted()
    {
        static::creating(function (self $detail) {
            $detail->hash = $detail->generateHash();
        });
        static::updating(function (self $detail) {
            $detail->hash = $detail->generateHash();
        });
    }
}