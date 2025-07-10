<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class BusinessConfiguration extends Model
{
    use HasFactory;
    protected $primaryKey = 'bus_config_id';
    protected $fillable = [
        'bus_name',
        'bus_ntn_cnic',
        'bus_address',
        'bus_province',
        'bus_logo',
        'bus_account_title',
        'bus_account_number',
        'bus_reg_num',
        'bus_contact_num',
        'bus_contact_person',
        'bus_IBAN',
        'bus_swift_code',
        'bus_acc_branch_name',
        'bus_acc_branch_code',
    ];
    public function invoices()
    {
        return $this->hasMany(Invoice::class, 'seller_id', 'bus_config_id');
    }
}