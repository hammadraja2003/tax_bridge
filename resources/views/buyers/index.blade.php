@extends('layouts.admin')

@section('content')
<div class="container">
    <h3>Buyers</h3>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <a href="{{ route('buyers.create') }}" class="btn btn-success mb-3">+ Add New Buyer</a>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>Logo</th>
                <th>Name</th>
                <th>Type</th>
                <th>NTN/CNIC</th>
                <th>Contact Person</th>
                <th>Contact #</th>
                <th>IBAN</th>
                <th>Account #</th>
                <th>Address</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @forelse($buyers as $buyer)
                <tr>
                    <td>
                        @if($buyer->byr_logo)
                            <img src="{{ asset('uploads/buyer_images/' . $buyer->byr_logo) }}" alt="Logo" width="50">
                        @else
                            <span class="text-muted">No Logo</span>
                        @endif
                    </td>
                    <td>{{ $buyer->byr_name }}</td>
                    <td>{{ $buyer->byr_type == 1 ? 'Registered' : 'Unregistered' }}</td>
                    <td>{{ $buyer->byr_ntn_cnic }}</td>
                    <td>{{ $buyer->byr_contact_person }}</td>
                    <td>{{ $buyer->byr_contact_num }}</td>
                    <td>{{ $buyer->byr_IBAN }}</td>
                    <td>{{ $buyer->byr_account_number }}</td>
                    <td>{{ $buyer->byr_address }}</td>
                    <td>
                        <a href="{{ route('buyers.edit', $buyer->byr_id) }}" class="btn btn-sm btn-warning">Edit</a>
                        <form action="{{ route('buyers.delete', $buyer->byr_id) }}" method="POST" style="display:inline;">
                            @csrf
                            <button onclick="return confirm('Delete this buyer?')" class="btn btn-sm btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
            @empty
                <tr><td colspan="10" class="text-center">No buyers found.</td></tr>
            @endforelse
        </tbody>
    </table>

    {{ $buyers->links() }}
</div>
@endsection
