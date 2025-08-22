@extends('layouts.admin')
@section('content')
    <div class="container-fluid">
        <h2>Audit Logs</h2>
        <div class="app-scroll overflow-auto" id="myTable">
            
            <table class="table table-bordered table-striped">
                <thead>
                    <tr class="app-sort">
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
                <tbody class="list" id="t-data">
                    @php $count = 1; @endphp
                    @foreach ($logs as $log)
                        <tr class="{{ $log->tampered ? 'table-danger' : '' }}">
                            <td class="id">{{ $count++ }}</td>
                            <td class="employee">{{ $log->table_name }}</td>
                            <td class="email">{{ $log->row_id }}</td>
                            <td class="status">{{ $log->action_type }}</td>
                            <td>{{ $log->user_name ?? $log->db_user }}</td>
                            <td>{{ $log->ip_address }}</td>
                            <td class="contact">{{ $log->device_info }}</td>
                            <td class="status">{{ $log->changed_at }}</td>
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
        </div>
        <div class="d-flex justify-content-between align-items-center px-3 py-2 small text-muted">
            <!-- <div id="table-count-info">
                Showing {{ $logs->firstItem() ?? 0 }} to {{ $logs->lastItem() ?? 0 }} of
                {{ $logs->total() }} entries
            </div> -->
            <div class="list-pagination">
                <div class="custom_pagination">
                    {{ $logs->links() }}
                </div>
            </div>

        </div>
    </div>
@endsection
