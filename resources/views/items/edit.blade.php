@extends('layouts.admin')
@section('content')
@include('layouts.partials.errors')
<div class="container">
  <h2 class="mb-4 text-center">Edit Services</h2>
  @if(session('success')) 
    <div class="alert alert-success">{{ session('success') }}</div> 
  @endif
  <form class="app-form needs-validation" novalidate method="POST" action="{{ route('items.update', $item->item_id) }}">
    @csrf
    <div class="card mb-4">
      <div class="card-body row g-3">
        <div class="col-md-6">
          <label class="form-label required">Item Description</label>
          <input type="text" name="item_description" value="{{ old('item_description', $item->item_description) }}" class="form-control" required />
          <div class="invalid-feedback">Please enter item description.</div>
          @error('item_description')
            <div class="invalid-feedback">{{ $message }}</div>
          @enderror
        </div>
        <div class="col-md-6">
          <label class="form-label">HS Code <i class="bi bi-info-circle" data-bs-toggle="tooltip" title="Harmonized System Code — used for customs classification. Required for manufacturer-cum-retailers."></i></label>
          <input type="text" name="item_hs_code" value="{{ old('item_hs_code', $item->item_hs_code) }}" class="form-control" />
        </div>
        <div class="col-md-6">
          <label class="form-label required">Price</label>
          <input type="number" step="0.01" name="item_price" value="{{ old('item_price', $item->item_price) }}" class="form-control" required />
          <div class="invalid-feedback">Please enter price.</div>
          @error('item_price')
            <div class="invalid-feedback">{{ $message }}</div>
          @enderror
        </div>
        <div class="col-md-6">
          <label class="form-label required">Tax Rate in % (e.g. 18)</label>
          <input type="number" name="item_tax_rate" value="{{ old('item_tax_rate', $item->item_tax_rate) }}" class="form-control" required />
          <div class="invalid-feedback">Please enter tax rate.</div>
          @error('item_tax_rate')
            <div class="invalid-feedback">{{ $message }}</div>
          @enderror
        </div>
        <div class="col-md-6">
          <label class="form-label required">Unit of Measure (UOM) <i class="bi bi-info-circle" data-bs-toggle="tooltip" title="Unit of Measure. E.g. Units, Boxes, Kg, or in this case Hours."></i></label>
          <input type="text" name="item_uom" value="{{ old('item_uom', $item->item_uom) }}" class="form-control" required />
          <div class="invalid-feedback">Please enter unit of measure.</div>
          @error('item_uom')
            <div class="invalid-feedback">{{ $message }}</div>
          @enderror
        </div>
          <div class="text-end">
            <button type="submit" class="btn btn-primary">Update Item</button>
          </div>
      
      </div>
    </div>
  </form>
</div>
<style>
    .required::after {
        content: ' *';
        color: red;
    }
</style>
@endsection
