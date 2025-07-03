@extends('layouts.admin')

@section('content')
<div class="container mt-4">
    <div class="card shadow">
        <div class="card-header">
            <h5>🧾 Select Xero Tenant to Sync Invoices</h5>
        </div>
        <div class="card-body">
            <form method="POST" action="{{ route('xero.sync_selected') }}">
                @csrf
                <div class="mb-3">
                    <label for="tenant_id" class="form-label">Tenant</label>
                    <select name="tenant_id" id="tenant_id" class="form-select" required>
                        <option value="">-- Select Tenant --</option>
                        @foreach ($tenants as $tenant)
                            <option value="{{ $tenant->getTenantId() }}">
                                {{ $tenant->getTenantName() }}
                            </option>
                        @endforeach
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">🔃 Sync Invoices</button>
            </form>
        </div>
    </div>
</div>
@endsection
