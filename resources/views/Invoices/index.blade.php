@extends('layouts.admin')

@section('content')
<div class="container">
    <h3>Invoices</h3>
    <a href="{{ route('invoices.create') }}" class="btn btn-primary mb-3">+ New Invoice</a>

    <form method="GET" class="row mb-3">
        <div class="col">
            <input type="text" name="invoice_type" class="form-control" placeholder="Invoice Type" value="{{ request('invoice_type') }}">
        </div>
        <div class="col">
            <input type="date" name="date_from" class="form-control" value="{{ request('date_from') }}">
        </div>
        <div class="col">
            <input type="date" name="date_to" class="form-control" value="{{ request('date_to') }}">
        </div>
        <div class="col">
            <button type="submit" class="btn btn-secondary">Filter</button>
        </div>
    </form>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Date</th>
                <th>Type</th>
                <th>Buyer</th>
                <th>Seller</th>
                <th>FBR #</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
        @foreach($invoices as $inv)
            <tr>
                <td>{{ $inv->invoice_date }}</td>
                <td>{{ $inv->invoice_type }}</td>
                <td>{{ $inv->buyer->byr_name ?? '-' }}</td>
                <td>{{ $inv->seller->bus_name ?? '-' }}</td>
                <td>{{ $inv->fbr_invoice_number ?? 'N/A' }}</td>
                <td>{{ $inv->response_status ?? 'Pending' }}</td>
            </tr>
        @endforeach
        </tbody>
    </table>

    {{ $invoices->links() }}
</div>
@endsection
