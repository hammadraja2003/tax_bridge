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
}