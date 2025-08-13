<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ActivityLog extends Model
{
    protected $table = 'activity_logs';

    protected $casts = [
        'data' => 'array', // ensures $log->data is automatically decoded from JSON
    ];

    // This will allow us to access $log->diff in Blade
    protected $appends = ['diff'];

    public function getDiffAttribute()
    {
        if ($this->action === 'update' && isset($this->data['old']) && isset($this->data['new'])) {
            $diff = [];
            foreach ($this->data['new'] as $key => $newValue) {
                $oldValue = $this->data['old'][$key] ?? null;
                if ($oldValue != $newValue) {
                    $diff[$key] = [
                        'old' => $oldValue,
                        'new' => $newValue
                    ];
                }
            }
            return $diff;
        }

        return null;
    }
}