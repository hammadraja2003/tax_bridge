@extends('layouts.admin')
@section('content')
<style>
  .required::after {
    content: ' *';
    color: red;
  }
</style>
  <h2 class="mb-4 text-center">Invoice Submission Form</h2>
  @if(session('success')) <div class="alert alert-success">{{ session('success') }}</div> @endif
  @if(session('error')) <div class="alert alert-danger">{{ session('error') }}</div> @endif
  <form id="invoiceForm" action="{{ route('create-new-invoice') }}" method="POST">
    @csrf
    <!-- Invoice Info -->
    <div class="card mb-4">
      <div class="card-header">Invoice Info</div>
      <div class="card-body row g-3">
        <div class="col-md-6">
            <label class="form-label required">Invoice Type</label>
            <select name="invoiceType" id="invoiceType" class="form-select" required onchange="toggleInvoiceRef()">
                <option value="">Select Invoice Type</option>
                <option value="Seller Note">Seller Note</option>
                <option value="Debit Note">Debit Note</option>
            </select>
        </div>
        <div class="col-md-6">
          <label class="form-label required">Invoice Date</label>
          <input type="date" name="invoiceDate" class="form-control" value="2025-04-21" required />
        </div>
        <div class="col-md-6" id="invoiceRefWrapper" style="display: none;">
            <label class="form-label">Invoice Ref No (if Debit Note)</label>
            <input type="text" name="invoiceRefNo" id="invoiceRefNo" class="form-control" />
        </div>
        <div class="col-md-6">
          <label class="form-label">Scenario ID</label>
          <input type="text" name="scenarioId" class="form-control" value="SN001" required />
        </div>
      </div>
    </div>
    <!-- Seller Info -->
    <div class="card mb-4">
      <div class="card-header">Seller Info</div>
      <div class="card-body row g-3">
        <div class="col-md-6">
          <label class="form-label required">NTN / CNIC</label>
          <input type="text" name="sellerNTNCNIC" class="form-control"  value="{{ $seller->bus_ntn_cnic }}" required readonly />
        </div>
        <div class="col-md-6">
          <label class="form-label required">Business Name</label>
          <input type="text" name="sellerBusinessName" class="form-control" value="{{ $seller->bus_name }}" required readonly />
        </div>
        <div class="col-md-6">
          <label class="form-label required">Province</label>
          <input type="text" name="sellerProvince" class="form-control" value="{{ $seller->bus_province }}" required readonly />
        </div>
        <div class="col-md-6">
          <label class="form-label required">Address</label>
          <textarea name="sellerAddress" class="form-control" required readonly>{{ $seller->bus_address }}</textarea>
        </div>
      </div>
    </div>
    <!-- Buyer Info -->
    <div class="card mb-4">
      <div class="card-header">Buyer Info</div>
      <div class="card-body row g-3">
        <div class="col-md-6">
          <label class="form-label required">Select Buyer</label>
          <select id="buyerSelect" class="form-select">
            <option value="">-- Choose Buyer --</option>
            @foreach($buyers as $b)
              <option value="{{ $b->byr_id }}">{{ $b->byr_name }}</option>
            @endforeach
          </select>
        </div>
        <div class="col-md-6">
          <label class="form-label">NTN / CNIC</label>
          <input type="text" name="buyerNTNCNIC" class="form-control" />
        </div>
        <div class="col-md-6">
          <label class="form-label">Province</label>
          <input type="text" name="buyerProvince" class="form-control" />
        </div>
        <div class="col-md-6">
          <label class="form-label">Address</label>
          <textarea name="buyerAddress" class="form-control"></textarea>
        </div>
        <div class="col-md-6">
          <label class="form-label required">Registration Type</label>
          <select name="buyerRegistrationType" class="form-select" required>
            <option value="">-- Select --</option>
            <option value="Registered">Registered</option>
            <option value="Unregistered">Unregistered</option>
          </select>
        </div>
      </div>
    </div>
    <!-- Invoice Items -->
    <div class="card mb-4">
      <div class="card-header d-flex justify-content-between align-items-center">
        <span>Invoice Items</span>
      </div>
      <div class="card-body" id="itemsContainer">
        <!-- Dynamic items will be appended here -->
      </div>
    </div>
    <div class="card mb-4">
      <div class="card-header">Summary</div>
      <div class="card-body row g-3">
        <div class="col-md-4">
          <label>Total Amount</label>
          <input id="totalAmount" class="form-control" readonly value="0" />
          <input type="hidden" name="totalInvoiceValue" id="totalInvoiceValue" value="0">
        </div>
        <div class="col-md-4">
          <label>Total Tax</label>
          <input id="totalTax" class="form-control" readonly value="0" />
          <input type="hidden" name="totalSalesTax" id="totalSalesTax" value="0">
        </div>
      </div>
    </div>
    <button id="submitBtn" type="submit" class="btn btn-success w-100" style="display: none">Submit Invoice</button>
  </form>
<!-- Item Template (hidden) -->
<template id="itemTemplate">
  <div class="item-group border rounded p-3 mb-4 position-relative">
    <button type="button" class="btn-close position-absolute end-0 top-0 remove-item" aria-label="Close"></button>
    <div class="row g-3">
      <div class="col-md-4">
        <label class="form-label required">Select Item/Service</label>
        <select name="items[][item_id]" class="form-select item-select" required>
          <option value="">--Choose Item--</option>
          @foreach($items as $i)
            <option value="{{ $i->item_id }}"
              data-price="{{ $i->item_price }}"
              data-tax="{{ $i->item_tax_rate }}"
              data-uom="{{ $i->item_uom }}"
              data-hs="{{ $i->item_hs_code }}">
              {{ $i->item_description }}
            </option>
          @endforeach
        </select>
      </div>
      <div class="col-md-4">
        <label class="form-label required">HS Code</label>
        <input type="text" name="items[][hsCode]" class="form-control" required />
      </div>
      <div class="col-md-4">
        <label class="form-label required">Product Description</label>
        <input type="text" name="items[][productDescription]" class="form-control" required />
      </div>
      <div class="col-md-4">
        <label class="form-label required">Tax Rate</label>
        <input type="text" name="items[][rate]" class="form-control" required readonly />
      </div>
      <div class="col-md-3">
        <label class="form-label required">UoM</label>
        <input type="text" name="items[][uoM]" class="form-control" required readonly />
      </div>
      <div class="col-md-3">
        <label class="form-label required">Quantity</label>
        <input type="number" name="items[][quantity]" class="form-control" required />
      </div>
      <div class="col-md-3">
        <label class="form-label required">Total Value</label>
        <input type="number" name="items[][totalValues]" class="form-control" required />
      </div>
      <div class="col-md-3">
        <label class="form-label required">Value Excl. Tax</label>
        <input type="number" name="items[][valueSalesExcludingST]" class="form-control"  required />
      </div>
      <div class="col-md-3">
        <label class="form-label">Retail Price</label>
        <input type="number" name="items[][fixedNotifiedValueOrRetailPrice]" class="form-control"  />
      </div>
      <div class="col-md-3">
        <label class="form-label required">Sales Tax Applicable</label>
        <input type="number" name="items[][SalesTaxApplicable]" class="form-control" required />
      </div>
      <div class="col-md-3">
        <label class="form-label required">Tax Withheld</label>
        <input type="number" name="items[][SalesTaxWithheldAtSource]" class="form-control" required />
      </div>
      <div class="col-md-3">
        <label class="form-label">Further Tax</label>
        <input type="number" name="items[][furtherTax]" class="form-control" />
      </div>
      <div class="col-md-3">
        <label class="form-label">Extra Tax</label>
        <input type="text" name="items[][extraTax]" class="form-control" />
      </div>
      <div class="col-md-3">
        <label class="form-label">FED Payable</label>
        <input type="number" name="items[][fedPayable]" class="form-control" />
      </div>
      <div class="col-md-3">
        <label class="form-label">Discount</label>
        <input type="number" name="items[][discount]" class="form-control" />
      </div>
      <div class="col-md-3">
        <label class="form-label required">Sale Type</label>
        <input type="text" name="items[][saleType]" class="form-control" placeholder="e.g. Goods at standard rate" required />
      </div>
      <div class="col-md-3">
        <label class="form-label">SRO Schedule No</label>
        <input type="text" name="items[][sroScheduleNo]" class="form-control" />
      </div>
      <div class="col-md-3">
        <label class="form-label">SRO Item Serial No</label>
        <input type="text" name="items[][sroItemSerialNo]" class="form-control" />
      </div>
      <div class="col-12 text-end">
        <button type="button" class="btn btn-outline-primary btn-sm mt-2 add-item">+ Add Another Item</button>
      </div>
    </div>
  </div>
</template>
<script>
  function updateSubmitButton() {
    $('#submitBtn').toggle($('.item-group').length > 0);
  }
  function addItem() {
    const $template = $($('#itemTemplate').html());
    $('#itemsContainer').append($template);
    updateSubmitButton();
  }
  $(document).ready(function () {
    // Add initial item
    addItem();
    // Add item on click
    $(document).on('click', '.add-item', function () {
      addItem();
    });
    // Remove item on click
    $(document).on('click', '.remove-item', function () {
      $(this).closest('.item-group').remove();
      updateSubmitButton();
    });
  });
</script>
<script>
  function toggleInvoiceRef() {
    const invoiceType = document.getElementById("invoiceType").value;
    const invoiceRefWrapper = document.getElementById("invoiceRefWrapper");
    const invoiceRefInput = document.getElementById("invoiceRefNo");
    if (invoiceType === "Debit Note") {
      invoiceRefWrapper.style.display = "block";
      invoiceRefInput.setAttribute("required", "required");
    } else {
      invoiceRefWrapper.style.display = "none";
      invoiceRefInput.removeAttribute("required");
      invoiceRefInput.value = ""; // Optional: Clear the value
    }
  }
</script>
@push('scripts')
<script>
$(document).ready(function(){
  $('#buyerSelect').change(function(){
    const id = $(this).val();
    if(!id) return;
    $.get('/buyers/'+id, function(b){
      console.log("Buyer loaded", b);
      $('[name=buyerNTNCNIC]').val(b.byr_ntn_cnic);
      $('[name=buyerAddress]').val(b.byr_address);
      $('[name=buyerProvince]').val(b.byr_province);
      $('[name=buyerRegistrationType]').val(b.byr_type == 1?'Registered':'Unregistered');
    });
  });
  $('#itemsContainer').on('change','.item-select', function(){
    const $row = $(this).closest('.item-group');
    const opt = $(this).find('option:selected');
    $row.find('[name$="[hsCode]"]').val(opt.data('hs'));
    $row.find('[name$="[rate]"]').val(opt.data('tax'));
    $row.find('[name$="[uoM]"]').val(opt.data('uom'));
    calculateRow($row);
  });
  $('#itemsContainer')
    .on('input','[name$="[quantity]"], [name$="[valueSalesExcludingST]"], .remove-item', updateTotals);
  function calculateRow($row){
    const qty = parseFloat($row.find('[name$="[quantity]"]').val())||0;
    const price = parseFloat($row.find('[name$="[valueSalesExcludingST]"]').val())||0;
    const taxP = parseFloat($row.find('[name$="[SalesTaxApplicable]"]').val())||0;
    const total = price * qty;
    const tax = total * (taxP/100);
    $row.find('[name$="[totalValues]"]').val((total+tax).toFixed(2));
    updateTotals();
  }
  function updateTotals(){
    let sum=0, taxSum=0;
    $('.item-group').each(function(){
      const tv = parseFloat($(this).find('[name$="[totalValues]"]').val())||0;
      const price = parseFloat($(this).find('[name$="[valueSalesExcludingST]"]').val())||0;
      sum += tv;
      taxSum += (tv - price);
    });
    $('#totalAmount').val(sum.toFixed(2));
    $('#totalInvoiceValue').val(sum.toFixed(2));
    $('#totalTax').val(taxSum.toFixed(2));
    $('#totalSalesTax').val(taxSum.toFixed(2));
  }
});
</script>
@endpush
@endsection
