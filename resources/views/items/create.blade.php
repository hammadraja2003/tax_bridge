@extends('layouts.admin')
@section('content')
<div class="container">
  <h2 class="mb-4 text-center">Add New Item / Services</h2>

  <form class="app-form needs-validation" novalidate method="POST" action="{{ route('items.store') }}">
    @csrf
    <div class="card mb-4">
      <div class="card-body row g-3">
        <div class="col-md-6">
          <label class="form-label required">Services Description</label>
          <textarea name="item_description" class="form-control" placeholder="Enter a Item Description"
            required></textarea>
          @error('item_description')
          <div class="invalid-feedback">{{ $message }}</div>
          @enderror
          <div class="invalid-feedback">Please enter item description.</div>
        </div>
        <div class="col-md-6">
          <label class="form-label">HS Code <i class="bi bi-info-circle" data-bs-toggle="tooltip"
              title="Harmonized System Code — used for customs classification. Required for manufacturer-cum-retailers."></i></label>
          <input type="text" name="item_hs_code" placeholder="Enter a HS Code" class="form-control" />
        </div>
        <div class="col-md-6">
          <label class="form-label required">Price</label>
          <input type="number" step="0.01" name="item_price" placeholder="Enter a Price" class="form-control"
            required />
          @error('item_price')
          <div class="invalid-feedback">{{ $message }}</div>
          @enderror
          <div class="invalid-feedback">Please enter Price.</div>
        </div>
        <div class="col-md-6">
          <label class="form-label required">Tax Rate in % (e.g. 18)</label>
          <input type="number" name="item_tax_rate" class="form-control" placeholder="Enter a ax Rate" required />
          @error('item_tax_rate')
          <div class="invalid-feedback">{{ $message }}</div>
          @enderror
          <div class="invalid-feedback">Please enter Tax Rate.</div>
        </div>
        <div class="col-md-6">
          <label class="form-label required">Unit of Measure (UOM) <i class="bi bi-info-circle" data-bs-toggle="tooltip"
              title="Unit of Measure. E.g. Units, Boxes, Kg, or in this case Hours."></i></label>
          <input type="text" name="item_uom" class="form-control" placeholder="Enter a Unit of Measure" required />
          @error('item_uom')
          <div class="invalid-feedback">{{ $message }}</div>
          @enderror
          <div class="invalid-feedback">Please enter UOM.</div>
        </div>
        <div class="text-end">
          <button type="submit" class="btn btn-primary">Save Item</button>
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