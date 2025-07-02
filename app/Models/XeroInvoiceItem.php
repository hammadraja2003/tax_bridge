<?php


namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class XeroInvoiceItem extends Model
{
    protected $fillable = [
        'invoice_id',
        'description',
        'quantity',
        'unit_amount',
        'line_amount',
        'item_code',
        'tax_amount',
    ];
    public function invoice()
    {
        return $this->belongsTo(XeroInvoice::class, 'invoice_id', 'invoice_id');
    }
}