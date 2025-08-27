<?php

use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\DB;
use App\Models\ActivityLog;
use App\Models\BusinessConfiguration;

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
        // 🔹 Ensure we're not logging into master DB
        $connection = (new ActivityLog())->getConnectionName();
        if ($connection === 'master') {
            // Option 1: Just skip logging silently
            // return false;            // Option 2: Throw error so you know tenant wasn’t set properly
            throw new \RuntimeException("Tenant connection not set. Refusing to log activity into master DB.");
        }
        $user = Auth::user();
        $userId = $user ? $user->id : null;
        $userName = $user ? $user->name : 'guest';
        $ip = Request::ip();
        $deviceId = Request::header('device-id') ?? 'unknown';        // 🔹 Normalize JSON for consistent hashing
        $dataJson = json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK);
        $newHash = hash('sha256', $dataJson);
        $hashChanged = ($action !== 'update'); // default: add/delete = true
        $oldHash = null;
        if ($action === 'update' && $recordId && $tableName) {
            $oldLog = ActivityLog::where('record_id', $recordId)
                ->where('table_name', $tableName)
                ->orderBy('created_at', 'desc')
                ->first();
            if ($oldLog) {
                $oldHash = $oldLog->data_hash;
                $hashChanged = $oldHash !== $newHash;
            }
        }        // ✅ Insert via model (tenant DB only)
        ActivityLog::create([
            'user_id'      => $userId,
            'user_name'    => $userName,
            'ip_address'   => $ip,
            'device_id'    => $deviceId,
            'action'       => $action,
            'description'  => $description,
            'record_id'    => $recordId,
            'table_name'   => $tableName,
            'data_hash'    => $newHash,
            'hash_changed' => $hashChanged,
            'data'         => $data, // will be cast to JSON automatically
            'created_at'   => now(),
        ]);
        return true;
    }
}
if (!function_exists('renderScenarioOptions')) {
    function renderScenarioOptions($selectedCode = null)
    {
        $businessId = session('bus_config_id');
        if (!$businessId) {
            return '<option value="">No Business Selected</option>';
        }
        $scenarios = DB::connection('master')
            ->table('business_scenarios as bs')
            ->join('sandbox_scenarios as ss', 'bs.scenario_id', '=', 'ss.scenario_id')
            ->where('bs.bus_config_id', $businessId)
            ->orderBy('ss.scenario_code', 'asc')
            ->get();
        $options = '<option value="">Select Scenario</option>';
        foreach ($scenarios as $scenario) {
            $isSelected = ($selectedCode === $scenario->scenario_code) ? 'selected' : '';
            $options .= '<option value="' . e($scenario->scenario_code) . '" 
                            data-sale-type="' . e($scenario->sale_type ?? '') . '" ' . $isSelected . '>'
                . e($scenario->scenario_code) . ' - ' . e($scenario->scenario_description)
                . '</option>';
        }
        return $options;
    }
}
if (!function_exists('getFbrEnv')) {
    function getFbrEnv(): string
    {
        $tenantId = Auth::user()->tenant_id ?? session('tenant_id');
        if (!$tenantId) {
            return 'sandbox'; // fallback
        }
        $config = BusinessConfiguration::where('bus_config_id', $tenantId)->first();
        if (!$config) {
            return 'sandbox'; // fallback
        }
        return $config->fbr_env ?? 'sandbox';
    }
}
if (!function_exists('getBusinessConfig')) {
    function getBusinessConfig()
    {
        $tenantId = Auth::check() ? Auth::user()->tenant_id : session('tenant_id');
        if (!$tenantId) {
            return null;
        }

        return BusinessConfiguration::where('bus_config_id', $tenantId)->first();
    }
}
if (!function_exists('businessLogo')) {
    function businessLogo()
    {
        $config = getBusinessConfig();
        return ($config && $config->bus_logo)
            ? asset('uploads/company/' . $config->bus_logo)
            : asset('assets/images/logo/secureism_logo.svg');
    }
}