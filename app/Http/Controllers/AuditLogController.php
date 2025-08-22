<?php

namespace App\Http\Controllers;

use App\Models\AuditLog;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AuditLogController extends Controller
{
    /**
     * Display audit logs with details.
     */
    public function index(Request $request)
    {
        $logs = AuditLog::query()
            ->leftJoin('users', function ($join) {
                $join->on(
                    DB::raw('audit_logs.db_user COLLATE utf8mb4_unicode_ci'),
                    '=',
                    DB::raw('users.email COLLATE utf8mb4_unicode_ci')
                );
            })
            ->select(
                'audit_logs.*',
                'users.name as user_name'
            )
            ->orderBy('changed_at', 'desc')
            ->paginate(10);

        // 🔎 Check tampering (row_hash_old vs calculated hash)
        foreach ($logs as $log) {
            $calculatedOldHash = $log->old_data ? hash('sha256', json_encode($log->old_data)) : null;
            $calculatedNewHash = $log->new_data ? hash('sha256', json_encode($log->new_data)) : null;

            $log->tampered = (
                ($log->row_hash_old && $log->row_hash_old !== $calculatedOldHash) ||
                ($log->row_hash_new && $log->row_hash_new !== $calculatedNewHash)
            );
        }

        return view('audit_logs.index', compact('logs'));
    }


    /**
     * Show single log details.
     */
    public function show($id)
    {
        $log = AuditLog::findOrFail($id);

        $calculatedOldHash = $log->old_data ? hash('sha256', json_encode($log->old_data)) : null;
        $calculatedNewHash = $log->new_data ? hash('sha256', json_encode($log->new_data)) : null;

        $log->tampered = (
            ($log->row_hash_old && $log->row_hash_old !== $calculatedOldHash) ||
            ($log->row_hash_new && $log->row_hash_new !== $calculatedNewHash)
        );

        return view('audit_logs.show', compact('log'));
    }
}