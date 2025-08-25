@extends('layouts.admin')
@section('content')
    <div class="container-fluid">
        <h2>Audit Logs</h2>
        <div class="app-scroll overflow-auto" id="myTable">
            <div class="list-table-header d-flex justify-content-end align-items-center p-3">
                <form class="app-form app-icon-form" action="#">
                    <div class="position-relative">
                        <input type="search" class="form-control search" placeholder="Search..."
                            aria-label="Search">
                    </div>
                </form>
            </div>
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
                            <td class="email">{{ $log->user_name ?? $log->db_user }}</td>
                            <td class="email">{{ $log->ip_address }}</td>
                            <td class="contact">{{ $log->device_info }}</td>
                            <td class="status">{{ $log->changed_at }}</td>
                            <td class="status">
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
              <div class="paginationtble-bottom">   
                {{ $logs->links() }} 
              </div>
        </div>
    </div>
@endsection
