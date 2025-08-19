<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AuditLog extends Model
{
    protected $table = 'audit_logs';
    protected $primaryKey = 'audit_id';
    public $timestamps = false; // You already have changed_at, so disable default timestamps

    protected $fillable = [
        'table_name',
        'row_id',
        'action_type',
        'old_data',
        'new_data',
        'row_hash_old',
        'row_hash_new',
        'db_user',
        'changed_at',
        'ip_address',
        'device_info'
    ];

    protected $casts = [
        'old_data' => 'array',
        'new_data' => 'array',
        'changed_at' => 'datetime',
    ];

    /**
     * Compute field-wise changes between old_data and new_data
     */
    public function getChangesAttribute()
    {
        $changes = [];
        $old = $this->old_data ?? [];
        $new = $this->new_data ?? [];

        foreach ($new as $key => $value) {
            if (!array_key_exists($key, $old) || $old[$key] != $value) {
                $changes[$key] = [
                    'old' => $old[$key] ?? null,
                    'new' => $value
                ];
            }
        }

        return $changes;
    }
}