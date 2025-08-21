@extends('layouts.admin')
@section('content')
    <div class="container-fluid">
        <h2>Audit Logs</h2>
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Sr #</th>
                    <th>Table</th>
                    <th>Row ID</th>
                    <th>Action</th>
                    <th>User</th>
                    <th>IP</th>
                    <th>Device</th>
                    <th>Changed At</th>
                    <th>Status</th>
                    <th>Details</th>
                </tr>
            </thead>
            <tbody>
                @php $count = 1; @endphp
                @foreach ($logs as $log)
                    <tr class="{{ $log->tampered ? 'table-danger' : '' }}">
                        <td>{{ $count++ }}</td>
                        <td>{{ $log->table_name }}</td>
                        <td>{{ $log->row_id }}</td>
                        <td>{{ $log->action_type }}</td>
                        <td>{{ $log->user_name ?? $log->db_user }}</td>
                        <td>{{ $log->ip_address }}</td>
                        <td>{{ $log->device_info }}</td>
                        <td>{{ $log->changed_at }}</td>
                        <td>
                            @if ($log->tampered)
                                <span class="badge bg-danger">Tampered</span>
                            @else
                                <span class="badge bg-success">Safe</span>
                            @endif
                        </td>
                        <td>
                            <a href="{{ route('audit_logs.show', $log->audit_id) }}" class="btn btn-sm btn-primary">
                                View
                            </a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>

        {{-- {{ $logs->links() }} --}}
    </div>
@endsection
