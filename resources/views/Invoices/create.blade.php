@extends('layouts.admin')

@section('content')

<style>
  .required::after {
    content: ' *';
    color: red;
  }
</style>

<div class="container">
  <h2 class="mb-4 text-center">Invoice Submission Form</h2>
  <form id="invoiceForm" action="https://your-api-endpoint.com/invoice" method="POST">
    
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
          <input type="text" name="sellerNTNCNIC" class="form-control" value="8923980-3" required />
        </div>
        <div class="col-md-6">
          <label class="form-label required">Business Name</label>
          <input type="text" name="sellerBusinessName" class="form-control" value="SECUREISM (PRIVATE) LIMITED" required />
        </div>
        <div class="col-md-6">
          <label class="form-label required">Province</label>
          <input type="text" name="sellerProvince" class="form-control" required />
        </div>
        <div class="col-md-6">
          <label class="form-label required">Address</label>
          <textarea name="sellerAddress" class="form-control" required>Innovation & Incubation Floor-3rd F3 Centre of Information & Cyber Security Sector B Zaraj Housing Scheme Islamabad</textarea>
        </div>
      </div>
    </div>

    <!-- Buyer Info -->
    <div class="card mb-4">
      <div class="card-header">Buyer Info</div>
      <div class="card-body row g-3">
      <div class="col-md-6">
          <label class="form-label">Business Name</label>
          <input type="text" name="bus_name" class="form-control" value="Sky Pass Travel & Tours" />
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
          <textarea name="buyerAddress" class="form-control">Office No 3, Mezzanine Floor, Rehman Plaza, Plot No. 75-East, Fazal-e-Haq Road, Blue Area, Islamabad</textarea>
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

    <button id="submitBtn" type="submit" class="btn btn-success w-100" style="display: none">Submit Invoice</button>
  </form>
</div>

<!-- Item Template (hidden) -->
<template id="itemTemplate">
  <div class="item-group border rounded p-3 mb-4 position-relative">
    <button type="button" class="btn-close position-absolute end-0 top-0 remove-item" aria-label="Close"></button>
    <div class="row g-3">
      <div class="col-md-4">
        <label class="form-label required">HS Code</label>
        <input type="text" name="items[][hsCode]" class="form-control" required />
      </div>
      <div class="col-md-4">
        <label class="form-label required">Product Description</label>
        <input type="text" name="items[][productDescription]" class="form-control" value="API Integration Services" required />
      </div>
      <div class="col-md-4">
        <label class="form-label required">Tax Rate</label>
        <input type="text" name="items[][rate]" class="form-control" value="15%" required />
      </div>
      <div class="col-md-3">
        <label class="form-label required">UoM</label>
        <input type="text" name="items[][uoM]" class="form-control" required />
      </div>
      <div class="col-md-3">
        <label class="form-label required">Quantity</label>
        <input type="number" name="items[][quantity]" class="form-control" value="1" required />
      </div>
      <div class="col-md-3">
        <label class="form-label required">Total Value</label>
        <input type="number" name="items[][totalValues]" class="form-control" value="0" required />
      </div>
      <div class="col-md-3">
        <label class="form-label required">Value Excl. Tax</label>
        <input type="number" name="items[][valueSalesExcludingST]" class="form-control" value="1000" required />
      </div>
      <div class="col-md-3">
        <label class="form-label">Retail Price</label>
        <input type="number" name="items[][fixedNotifiedValueOrRetailPrice]" class="form-control" value="0" />
      </div>
      <div class="col-md-3">
        <label class="form-label required">Sales Tax Applicable</label>
        <input type="number" name="items[][SalesTaxApplicable]" class="form-control" value="18" required />
      </div>
      <div class="col-md-3">
        <label class="form-label required">Tax Withheld</label>
        <input type="number" name="items[][SalesTaxWithheldAtSource]" class="form-control" value="0" required />
      </div>
      <div class="col-md-3">
        <label class="form-label">Further Tax</label>
        <input type="number" name="items[][furtherTax]" class="form-control" value="120" />
      </div>
      <div class="col-md-3">
        <label class="form-label">Extra Tax</label>
        <input type="text" name="items[][extraTax]" class="form-control" />
      </div>
      <div class="col-md-3">
        <label class="form-label">FED Payable</label>
        <input type="number" name="items[][fedPayable]" class="form-control" value="0" />
      </div>
      <div class="col-md-3">
        <label class="form-label">Discount</label>
        <input type="number" name="items[][discount]" class="form-control" value="0" />
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

<!-- jQuery Script -->
<script src="{{ asset('assets/js/jquery-3.6.3.min.js') }}"></script>
<script>
  function updateSubmitButton() {
    $('#submitBtn').toggle($('.item-group').length > 0);
  }

  function addItem() {
    const $template = $('#itemTemplate').html();
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

@endsection
