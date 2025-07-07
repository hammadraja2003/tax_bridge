<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Item extends Model
{
    use HasFactory;
    protected $primaryKey = 'item_id';
    protected $fillable = [
        'item_hs_code',
        'item_description',
        'item_price',
        'item_tax_rate',
        'item_uom',
    ];
    public function invoiceDetails()
    {
        return $this->hasMany(InvoiceDetail::class, 'item_id', 'item_id');
    }
}