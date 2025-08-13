<?php

use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\DB;

if (!function_exists('logError')) {
    function logError(array $context = [])
    {
        $message = "";
        if (isset($context['exception']) && $context['exception'] instanceof \Exception) {
            $exception = $context['exception'];
            $message .= ' | Exception: ' . $exception->getMessage();
            $message .= ' | File: ' . $exception->getFile();
            $message .= ' | Line: ' . $exception->getLine();
            unset($context['exception']);
        }
        Log::channel('grclogs')->error($message, $context);
        Log::channel('slack')->error($message, $context);
    }
}
if (!function_exists('logActivity')) {
    function logActivity($action, $description, array $data, $recordId = null, $tableName = null)
    {
        // Current user and info
        $user = Auth::user();
        $userId = $user ? $user->id : null;
        $userName = $user ? $user->name : 'guest';
        $ip = Request::ip();
        $deviceId = Request::header('device-id') ?? 'unknown';

        // 🔹 Normalize JSON for consistent hashing
        $dataJson = json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK);
        $newHash = hash('sha256', $dataJson);

        // On update, compare hash with old hash
        $hashChanged = ($action !== 'update'); // default: add/delete = true
        $oldHash = null;
        if ($action === 'update' && $recordId && $tableName) {
            $oldLog = DB::table('activity_logs')
                ->where('record_id', $recordId)
                ->where('table_name', $tableName)
                ->orderBy('created_at', 'desc')
                ->first();

            if ($oldLog) {
                $oldHash = $oldLog->data_hash;
                $hashChanged = $oldHash !== $newHash;
            }
        }

        // Save log entry
        DB::table('activity_logs')->insert([
            'user_id' => $userId,
            'user_name' => $userName,
            'ip_address' => $ip,
            'device_id' => $deviceId,
            'action' => $action,
            'description' => $description,
            'record_id' => $recordId,
            'table_name' => $tableName,
            'data_hash' => $newHash,
            'hash_changed' => $hashChanged,
            'data' => $dataJson,
            'created_at' => now(),
        ]);

        return true;
    }
}