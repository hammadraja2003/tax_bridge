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
        'scenario_id',
        'invoice_ref_no',
        'seller_id',
        'buyer_id',
        'fbr_invoice_number',
        'is_posted_to_fbr',
        'response_status',
        'response_message',
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
}