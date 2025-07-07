@extends('layouts.admin')
@section('content')
<div class="container">
    <h3 class="mb-4">Items</h3>
    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif
    <a href="{{ route('items.create') }}" class="btn btn-success mb-3">+ Add New Item</a>
    <div class="table-responsive">
        <table id="itemsTable" class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>Description</th>
                    <th>HS Code</th>
                    <th>Price</th>
                    <th>Tax Rate</th>
                    <th>UOM</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                @foreach($items as $item)
                    <tr>
                        <td>{{ $item->item_description }}</td>
                        <td>{{ $item->item_hs_code }}</td>
                        <td>{{ $item->item_price }}</td>
                        <td>{{ $item->item_tax_rate }}</td>
                        <td>{{ $item->item_uom }}</td>
                        <td>
                            <a href="{{ route('items.edit', $item->item_id) }}" class="btn btn-sm btn-warning">Edit</a>
                            <form action="{{ route('items.delete', $item->item_id) }}" method="POST" style="display:inline;">
                                @csrf
                                <button onclick="return confirm('Delete this item?')" class="btn btn-sm btn-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
@endsection