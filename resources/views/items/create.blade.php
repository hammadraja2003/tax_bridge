@extends('layouts.admin')
@section('content')
@include('layouts.partials.errors')
<div class="container">
  <h2 class="mb-4 text-center">Add New Item</h2>
  @if(session('success')) <div class="alert alert-success">{{ session('success') }}</div> @endif
  <form class="app-form needs-validation" novalidate method="POST" action="{{ route('items.store') }}">
    @csrf
    <div class="card mb-4">
      <div class="card-body row g-3">
        <div class="col-md-6">
          <label class="form-label required">Item Description</label>
          <input type="text" name="item_description" class="form-control" required />
          <div class="invalid-feedback">Please enter item description.</div>
        </div>
        <div class="col-md-6">
          <label class="form-label required">HS Code</label>
          <input type="text" name="item_hs_code" class="form-control" />
        </div>
        <div class="col-md-6">
          <label class="form-label required">Price</label>
          <input type="number" step="0.01" name="item_price" class="form-control" required />
        </div>
        <div class="col-md-6">
          <label class="form-label required">Tax Rate in % (e.g. 18)</label>
          <input type="number" name="item_tax_rate" class="form-control" required />
        </div>
        <div class="col-md-6">
          <label class="form-label required">Unit of Measure (UOM)</label>
          <input type="text" name="item_uom" class="form-control" required />
        </div>
        <div class="col-md-2 mt-3 ms-auto text-end">
          <div class="mb-3">
            <button type="submit" class="btn btn-primary w-100">Save Item</button>
          </div>
        </div>
      </div>
    </div>
  </form>
</div>
@endsection
