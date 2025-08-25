@extends('layouts.admin')
@section('content')
<div class="container">
    <h4>FBR Post Errors</h4>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Date/Time</th>
                <th>Type</th>
                <th>Status Code</th>
                <th>Status</th>
                <th>Error Code</th>
                <th>Error</th>
            </tr>
        </thead>
        <tbody>
          @forelse($fbrErrors as $err)
            <tr>
                <td>{{ \Carbon\Carbon::parse($err->error_time)->format('M-d-Y H:i:s') }}</td>
                <td>{{ $err->type }}</td>
                <td>{{ $err->status_code }}</td>
                <td>{{ $err->status }}</td>
                <td>{{ $err->error_code }}</td>
                <td>{{ $err->error }}</td>
            </tr>
            @empty
            <tr>
                <td colspan="6" class="text-center text-muted">No FBR posting errors found.</td>
            </tr>
            @endforelse
        </tbody>
    </table>
        <div class="paginationtble-bottom">   
            {{ $fbrErrors->links() }} 
        </div>
</div>
@endsection
