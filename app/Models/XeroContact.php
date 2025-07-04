<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class XeroContact extends Model
{
    protected $guarded = [];

    public function invoices()
    {
        return $this->hasMany(XeroInvoice::class, 'contact_id', 'contact_id');
    }
}