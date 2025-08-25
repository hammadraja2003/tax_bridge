<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
use App\Services\TenantManager;
use Illuminate\Support\Facades\DB;

class SetTenant
{
    protected $tenantManager;
    public function __construct(TenantManager $tenantManager)
    {
        $this->tenantManager = $tenantManager;
    }
    public function handle($request, Closure $next)
    {
        $tenantManager = app(\App\Services\TenantManager::class);
        // user has tenant_id in users table
        $tenantId = Auth::user()->tenant_id ?? session('tenant_id');
        if ($tenantId) {
            // Map tenant_id → bus_config_id
            $business = DB::connection('master')
                ->table('business_configurations')
                ->where('bus_config_id', $tenantId) // ✅ match with bus_config_id
                ->first();
            if ($business) {
                $tenantManager->setTenant($business->bus_config_id);
                session([
                    'tenant_id'    => $tenantId,
                    'bus_config_id' => $business->bus_config_id,
                    'tenant_db'    => $business->db_name,
                ]);
            }
        }
        return $next($request);
    }
}