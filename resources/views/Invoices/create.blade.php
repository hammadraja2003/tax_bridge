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
  <form class="app-form needs-validation" novalidate id="invoiceForm" action="{{ route('create-new-invoice') }}" method="POST">
    @csrf
    <!-- Invoice Info -->
    <div class="card mb-4">
      <div class="card-header">Invoice Info</div>
      <div class="card-body row g-3">
        <div class="col-md-3">
            <label class="form-label required">Invoice Type</label>
            <select name="invoiceType" id="invoiceType" class="form-select" required onchange="toggleInvoiceRef()">
                <option value="">Select Invoice Type</option>
                <option value="Sales Invoice">Sales Invoice</option>
                <option value="Debit Note">Debit Note</option>
            </select>
        </div>
        <div class="col-md-3">
          <label class="form-label required">Invoice Date</label>
          <input type="date" name="invoiceDate" class="form-control" required />
        </div>
        <div class="col-md-3">
          <label class="form-label">Due Date</label>
          <input type="date" name="due_date" class="form-control"  />
        </div>
        <div class="col-md-3" id="invoiceRefWrapper" style="display: none;">
            <label class="form-label">Invoice Ref No (if Debit Note)</label>
            <input type="text" name="invoiceRefNo" id="invoiceRefNo" class="form-control" />
        </div>
        <div class="col-md-3">
          <label class="form-label">Scenario ID (Optional)</label>
          <input type="text" name="scenarioId" class="form-control" />
        </div>
      </div>
    </div>
    <!-- Seller Info -->
    <div class="card mb-4">
      <div class="card-header">Seller Info</div>
      <div class="card-body row g-3">
        <div class="col-md-4">
          <label class="form-label required">NTN / CNIC</label>
          <input type="hidden" name="seller_id"  value="{{ $seller->bus_config_id }}" />
          <input type="text" name="sellerNTNCNIC" class="form-control"  value="{{ $seller->bus_ntn_cnic }}" required readonly />
        </div>
        <div class="col-md-4">
          <label class="form-label required">Business Name</label>
          <input type="text" name="sellerBusinessName" class="form-control" value="{{ $seller->bus_name }}" required readonly />
        </div>
        <div class="col-md-4">
          <label class="form-label required">Province</label>
          <input type="text" name="sellerProvince" class="form-control" value="{{ $seller->bus_province }}" required readonly />
        </div>
        <div class="col-md-12">
          <label class="form-label required">Address</label>
          <textarea name="sellerAddress" class="form-control" required readonly>{{ $seller->bus_address }}</textarea>
        </div>
      </div>
    </div>
    <!-- Buyer Info -->
    <div class="card mb-4">
      <div class="card-header">
        Buyer Info
      </div>
      <div class="card-body row g-3">
        <div class="col-md-12">
          <div class="alert alert-info py-2">
            <strong>Note:</strong> If <em>Buyer Registration Type</em> is <strong>Unregistered</strong>, then all fields except <strong>Registration Type</strong> are optional.
          </div>
        </div>
    
        <div class="col-md-4">
          <label class="form-label required">Select Buyer</label>
          <select id="byr_id" class="form-select" name="byr_id">
            <option value="">-- Choose Buyer --</option>
            @foreach($buyers as $b)
              <option value="{{ $b->byr_id }}">{{ $b->byr_name }}</option>
            @endforeach
          </select>
        </div>
    
        <div class="col-md-4">
          <label class="form-label">NTN / CNIC</label>
          <input type="text" name="buyerNTNCNIC" class="form-control optional-field" />
        </div>
    
        <div class="col-md-4">
          <label class="form-label">Province</label>
          <input type="text" name="buyerProvince" class="form-control optional-field" />
        </div>
    
        <div class="col-md-4">
          <label class="form-label required">Registration Type</label>
          <select name="buyerRegistrationType" id="buyerRegistrationType" class="form-select" required>
            <option value="">-- Select --</option>
            <option value="Registered">Registered</option>
            <option value="Unregistered">Unregistered</option>
          </select>
        </div>
    
        <div class="col-md-12">
          <label class="form-label">Address</label>
          <textarea name="buyerAddress" class="form-control optional-field"></textarea>
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
          <label>Total Invoice Amount Excluding Tax</label>
          <input id="totalAmountExcludingTax" name="totalAmountExcludingTax" class="form-control" readonly value="0" />
          
        </div>
        <div class="col-md-4">
          <label>Total Invoice Amount Including Tax</label>
          <input id="totalAmountIncludingTax" name="totalAmountIncludingTax" class="form-control" value="0">
        </div>
        <div class="col-md-4">
          <label>Total Sales Tax</label>
          <input id="totalSalesTax" name="totalSalesTax" class="form-control"  value="0"> 
        </div>
        <div class="col-md-4">
          <label>Total Further Tax</label>
          <input id="totalfurtherTax" name="totalfurtherTax" class="form-control"  value="0"> 
        </div>
        <div class="col-md-4">
          <label>Total Extra Tax</label>
          <input id="totalextraTax" name="totalextraTax" class="form-control"  value="0"> 
        </div>
      </div>
    </div> 
    <div class="card mb-4">
      <div class="card-body row g-3">
        <div class="col-md-12 text-end">
          <button id="submitBtn" type="submit" class="btn btn-primary">Save Invoice
          </button>
        </div>
      </div>
    </div>
     
    
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
              data-hs="{{ $i->item_hs_code }}"
              data-description="{{ $i->item_description }}"
              >
              {{ $i->item_description }}
            </option>
          @endforeach
        </select>
      </div>
      <div class="col-md-4">
        <label class="form-label">HS Code <i class="bi bi-info-circle" data-bs-toggle="tooltip" title="Harmonized System Code — used for customs classification. Required for manufacturer-cum-retailers."></i></label>
        <input type="text" name="items[][hsCode]" class="form-control" />
      </div>
      <div class="col-md-4">
        <label class="form-label required">Product Description <i class="bi bi-info-circle" data-bs-toggle="tooltip" title="A clear description of the service or product."></i></label>
        <input type="text" name="items[][productDescription]" class="form-control" required />
      </div>
      <div class="col-md-4">
        <label class="form-label required">Item Price</label>
        <input type="number" min="0" step="0.01" name="items[][item_price]" class="form-control" required readonly />
      </div>
      <div class="col-md-4">
        <label class="form-label required">Tax Rate in % <i class="bi bi-info-circle" data-bs-toggle="tooltip" title="Represents Sales Tax Rate. It matches SalesTaxApplicable."></i></label>
        <input type="text" name="items[][rate]" class="form-control" required readonly />
      </div>
      <div class="col-md-4">
        <label class="form-label required">UoM <i class="bi bi-info-circle" data-bs-toggle="tooltip" title="Unit of Measure. E.g. Units, Boxes, Kg, or in this case Hours."></i></label>
        <input type="text" name="items[][uoM]" class="form-control" required readonly />
      </div>
      <div class="col-md-4">
        <label class="form-label required">Quantity <i class="bi bi-info-circle" data-bs-toggle="tooltip" title="Quantity being sold or delivered."></i></label>
        <input type="number" min="0" step="0.01" name="items[][quantity]" class="form-control" required />
      </div>
      <div class="col-md-4">
        <label class="form-label required">Total Value Excluding Tax <i class="bi bi-info-circle" data-bs-toggle="tooltip" title="Per unit value **excluding** sales tax. So for 2 units, subtotal = 2 × 1000 = 2000."></i></label>
        <input type="number" min="0" step="0.01" name="items[][valueSalesExcludingST]" class="form-control"  required />
      </div>
      <div class="col-md-4">
        <label class="form-label required">Total Value Including Tax <i class="bi bi-info-circle" data-bs-toggle="tooltip" title="Total value **including tax**. 18% tax on Rs. 2000 = 360, so total = 2000 + 360 = 2360"></i> </label>
        <input type="number" min="0" step="0.01" name="items[][totalValues]" class="form-control" required />
      </div>
      
      <div class="col-md-4">
        <label class="form-label">Retail Price <i class="bi bi-info-circle" data-bs-toggle="tooltip" title="If the item is price-controlled (e.g., FMCG), the notified retail price goes here. For services or custom billing, leave as 0."></i></label>
        <input type="number" name="items[][fixedNotifiedValueOrRetailPrice]" class="form-control"  />
      </div>
      <div class="col-md-4">
        <label class="form-label required">Sales Tax Applicable <i class="bi bi-info-circle" data-bs-toggle="tooltip" title="Numeric value of applicable sales tax %."></i></label>
        <input type="number" min="0" step="0.01" name="items[][SalesTaxApplicable]" class="form-control" required />
      </div>
      <div class="col-md-4">
        <label class="form-label required">Tax Withheld <i class="bi bi-info-circle" data-bs-toggle="tooltip" title="If you're withholding tax on behalf of the seller (as a withholding agent), mention here Else 0."></i></label>
        <input type="number" name="items[][SalesTaxWithheldAtSource]" class="form-control" required />
      </div>
      <div class="col-md-4">
        <label class="form-label required">Sale Type <i class="bi bi-info-circle" data-bs-toggle="tooltip" title=" Important: Describes the nature of sale.Could be: 'Goods at reduced rate', 'Exempt', 'Zero-rated', 'Services', etc."></i></label>
        <input type="text" name="items[][saleType]" class="form-control" value="Services" placeholder="e.g. Goods at standard rate" required />
      </div>
      <div class="col-md-4">
        <label class="form-label">Further Tax (Optional) <i class="bi bi-info-circle" data-bs-toggle="tooltip" title="If buyer is **unregistered**, FBR may require Further Tax (typically 3% or more). Optional but calculated if applicabl"></i></label>
        <input type="number" name="items[][furtherTax]" class="form-control" />
      </div>
      <div class="col-md-4">
        <label class="form-label">Extra Tax (Optional) <i class="bi bi-info-circle" data-bs-toggle="tooltip" title=" Only applies to specific industries — e.g., sugar, cement. Leave blank if not applicable."></i></label>
        <input type="text" name="items[][extraTax]" class="form-control" />
      </div>
      <div class="col-md-4">
        <label class="form-label">FED Payable (Optional) <i class="bi bi-info-circle" data-bs-toggle="tooltip" title="Federal Excise Duty — applicable in certain services/goods (e.g., telecom, beverages). 0 if not applicable."></i></label>
        <input type="number" name="items[][fedPayable]" class="form-control" />
      </div>
      <div class="col-md-4">
        <label class="form-label">Discount (Optional) <i class="bi bi-info-circle" data-bs-toggle="tooltip" title="Any discount offered per item — reduces `valueSalesExcludingST`."></i></label>
        <input type="number" name="items[][discount]" class="form-control" />
      </div>
      <div class="col-md-4">
        <label class="form-label">SRO Schedule No (Optional) <i class="bi bi-info-circle" data-bs-toggle="tooltip" title="Optional: Relevant only if item has special treatment via an SRO (Statutory Regulatory Order)"></i></label>
        <input type="text" name="items[][sroScheduleNo]" class="form-control" />
      </div>
      <div class="col-md-4">
        <label class="form-label">SRO Item Serial No (Optional) <i class="bi bi-info-circle" data-bs-toggle="tooltip" title="Optional: Used if your item appears in an SRO Schedule and has a specific serial number."></i></label>
        <input type="text" name="items[][sroItemSerialNo]" class="form-control" />
      </div>
      <div class="col-12 text-end">
        <button type="button" class="btn btn-outline-primary btn-sm mt-2 add-item">+ Add Another Item</button>
      </div>
    </div>
  </div>
</template>
@push('scripts')
<script>
  document.addEventListener('DOMContentLoaded', function () {
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    tooltipTriggerList.forEach(function (tooltipTriggerEl) {
      new bootstrap.Tooltip(tooltipTriggerEl)
    })
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
      invoiceRefInput.value = "";
    }
  }
</script>
<script>
$(document).ready(function(){
  $('#byr_id').change(function(){
    const id = $(this).val();
    if (!id) {
      // Clear all fields if nothing selected
      $('[name=buyerNTNCNIC]').val('');
      $('[name=buyerAddress]').val('');
      $('[name=buyerProvince]').val('');
      $('[name=buyerRegistrationType]').val('');
      return;
    }
    $.get('/buyers/'+id, function(b){
      $('[name=buyerNTNCNIC]').val(b.byr_ntn_cnic);
      $('[name=buyerAddress]').val(b.byr_address);
      $('[name=buyerProvince]').val(b.byr_province);
      $('[name=buyerRegistrationType]').val(b.byr_type == 1?'Registered':'Unregistered');
    });
  });
});
</script>

<script>
  function parseFloatSafe(value) {
    const num = parseFloat(value);
    return isNaN(num) ? 0 : num;
  }

  function showWarningIfInvalid($field, label = 'This') {
    const val = parseFloatSafe($field.val());
    if (val <= 0) {
      $field.addClass('is-invalid');
      $field[0].setCustomValidity("Must be greater than zero");
      $field.closest('.form-group, .col-md-4').find('.invalid-feedback').remove();
      $field.after(`<div class="invalid-feedback">${label} must be greater than zero.</div>`);
      return false;
    } else {
      $field.removeClass('is-invalid').removeAttr('data-invalid');
      $field[0].setCustomValidity("");
      $field.closest('.form-group, .col-md-4').find('.invalid-feedback').remove();
      return true;
    }
  }

  function updateSubmitButton() {
    $('#submitBtn').toggle($('.item-group').length > 0);
  }

let itemIndex = 0;
function addItem() {
  const $template = $($('#itemTemplate').html());

  // Inject Tax Amount field before the last column
  const taxField = `
    <div class="col-md-4">
      <label class="form-label">Tax Amount</label>
      <input type="number" name="items[${itemIndex}][calculatedTax]" class="form-control" readonly />
    </div>`;
  $template.find('.row.g-3 .col-12.text-end').before(taxField);

  // Fix name attributes to include the current itemIndex
  $template.find('input, select, textarea').each(function () {
    const name = $(this).attr('name');
    if (name) {
      const newName = name.replace('items[][', `items[${itemIndex}][`);
      $(this).attr('name', newName);
    }
  });

  $('#itemsContainer').append($template);
  itemIndex++; // Increment index after use
  updateSubmitButton();
}


  function calculateRow($row) {
    const qtyField = $row.find('[name$="[quantity]"]');
    const priceField = $row.find('[name$="[item_price]"]');
    const taxRateField = $row.find('[name$="[SalesTaxApplicable]"]');

    const qty = parseFloatSafe(qtyField.val());
    const itemPrice = parseFloatSafe(priceField.val());
    const taxRate = parseFloatSafe(taxRateField.val());

    const validQty = showWarningIfInvalid(qtyField, "Quantity");
    const validPrice = showWarningIfInvalid(priceField, "Item Price");
    const validTax = showWarningIfInvalid(taxRateField, "Tax Rate");

    if (!validQty || !validPrice || !validTax) return;

    const totalExclTax = qty * itemPrice;
    const taxAmount = totalExclTax * (taxRate / 100);
    const totalInclTax = totalExclTax + taxAmount;

    $row.find('[name$="[valueSalesExcludingST]"]').val(totalExclTax.toFixed(2));
    $row.find('[name$="[totalValues]"]').val(totalInclTax.toFixed(2));
    $row.find('[name$="[calculatedTax]"]').val(taxAmount.toFixed(2));
  }

  function updateTotals() {
    let totalAmountExcludingTax = 0;
    let totalAmountIncludingTax = 0;
    let totalTax = 0;

    $('.item-group').each(function () {
      const $row = $(this);
      const exclVal = parseFloatSafe($row.find('[name$="[valueSalesExcludingST]"]').val());
      const totalVal = parseFloatSafe($row.find('[name$="[totalValues]"]').val());

      totalAmountExcludingTax += exclVal;
      totalAmountIncludingTax += totalVal;
      totalTax += (totalVal - exclVal);
    });

    $('#totalAmountExcludingTax').val(totalAmountExcludingTax.toFixed(2));
    $('#totalAmountIncludingTax').val(totalAmountIncludingTax.toFixed(2));
    $('#totalSalesTax').val(totalTax.toFixed(2));
  }

  $(document).ready(function () {
    // Initial item
    addItem();

    // Add new item
    $(document).on('click', '.add-item', function () {
      addItem();
    });

    // Remove item
    $(document).on('click', '.remove-item', function () {
      $(this).closest('.item-group').remove();
      updateSubmitButton();
      updateTotals();
    });

    // On item change → auto-fill & calculate
    $(document).on('change', '.item-select', function () {
      const $row = $(this).closest('.item-group');
      const opt = $(this).find('option:selected');

      $row.find('[name$="[hsCode]"]').val(opt.data('hs') || '');
      $row.find('[name$="[rate]"]').val(opt.data('tax') || '');
      $row.find('[name$="[uoM]"]').val(opt.data('uom') || '');
      $row.find('[name$="[productDescription]"]').val(opt.data('description') || '');
      $row.find('[name$="[item_price]"]').val(opt.data('price') || '');
      $row.find('[name$="[SalesTaxApplicable]"]').val(opt.data('tax') || '');

      calculateRow($row);
      updateTotals();
    });

    // Live input recalculates
    $(document).on('input', '[name$="[quantity]"], [name$="[item_price]"], [name$="[SalesTaxApplicable]"]', function () {
      const $row = $(this).closest('.item-group');
      calculateRow($row);
      updateTotals();
    });
  });
</script>

<script>
  function parseFloatSafe(val) {
    return parseFloat(val) || 0;
  }

  function updateTaxTotalsFromItems() {
    let totalfurtherTax = 0;
    let totalextraTax = 0;

    $('.item-group').each(function () {
      const $row = $(this);
      const furtherTax = parseFloatSafe($row.find('[name$="[furtherTax]"]').val());
      const extraTax = parseFloatSafe($row.find('[name$="[extraTax]"]').val());

      totalfurtherTax += furtherTax;
      totalextraTax += extraTax;
    });

    $('#totalfurtherTax').val(totalfurtherTax.toFixed(2));
    $('#totalextraTax').val(totalextraTax.toFixed(2));
  }

  $(document).ready(function () {
    $('#itemsContainer').on('input', '[name$="[furtherTax]"], [name$="[extraTax]"]', function () {
      updateTaxTotalsFromItems();
    });
  });
</script>






<script>
  document.addEventListener('DOMContentLoaded', function () {
    const registrationType = document.getElementById('buyerRegistrationType');
    const optionalFields = document.querySelectorAll('.optional-field');

    function updateFieldRequirements() {
      const isUnregistered = registrationType.value === 'Unregistered';

      optionalFields.forEach(field => {
        if (isUnregistered) {
          field.removeAttribute('required');
        } else {
          field.setAttribute('required', 'required');
        }
      });
    }

    registrationType.addEventListener('change', updateFieldRequirements);
    updateFieldRequirements(); // Run on page load as well
  });
</script>

@endpush
@endsection
