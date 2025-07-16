<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Buyer extends Model
{
    protected $table = 'buyers';
    protected $primaryKey = 'byr_id';
    public $timestamps = true;
    protected $fillable = [
        'byr_name',
        'byr_type',
        'byr_ntn_cnic',
        'byr_address',
        'byr_province',
        'byr_logo',
        'byr_account_title',
        'byr_account_number',
        'byr_reg_num',
        'byr_contact_num',
        'byr_contact_person',
        'byr_IBAN',
        'byr_swift_code',
        'byr_acc_branch_name',
        'byr_acc_branch_code',
    ];
    public function invoices()
    {
        return $this->hasMany(\App\Models\Invoice::class, 'buyer_id', 'byr_id');
    }
}