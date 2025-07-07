@extends('layouts.admin')

@section('content')
@include('layouts.partials.errors')
<div class="container">
  <h2 class="mb-4 text-center">Company Configuration</h2>
  <form class="app-form needs-validation" novalidate method="POST" action="{{ route('company.configuration.save') }}" enctype="multipart/form-data">
    @csrf
    <div class="card mb-4">
      <div class="card-body">
        <div class="row mb-3">
          <div class="col-md-6">
            <label class="form-label required">Name</label>
            <input type="text" name="bus_name" placeholder="Enter a Buissness Name" class="form-control" required value="{{ old('bus_name', $config->bus_name ?? '') }}">
            <div class="invalid-feedback">
                Please Enter Business Configuration.
            </div>
            @error('bus_name') 
            <div class="invalid-feedback">
                {{ $message }}
            </div>
            @enderror
          </div>
          <div class="col-md-6">
            <label class="form-label required">NTN / CNIC</label>
            <input type="text" name="bus_ntn_cnic" placeholder="Enter a NTN / CNIC" class="form-control" required value="{{ old('bus_ntn_cnic', $config->bus_ntn_cnic ?? '') }}">
            <div class="invalid-feedback">Please Enter Business NTN/CNIC.</div>
            @error('bus_ntn_cnic') <div class="invalid-feedback">{{ $message }}</div> @enderror
          </div>
        </div>

        <div class="mb-3">
          <label class="form-label required">Address</label>
          <textarea name="bus_address" class="form-control" placeholder="Enter a Addres" required>{{ old('bus_address', $config->bus_address ?? '') }}</textarea>
          <div class="invalid-feedback">
            Please Enter Business Address.
          </div>
          @error('bus_address') 
            <div class="invalid-feedback">
                {{ $message }}
            </div> 
          @enderror
        </div>

        <div class="row mb-3">
          <div class="col-md-6">
            <label class="form-label required">Account Number</label>
            <input type="text" name="bus_account_number" class="form-control"  placeholder="Enter a Account Number" value="{{ old('bus_account_number', $config->bus_account_number ?? '') }}" required>
            <div class="invalid-feedback">
                Please Enter Account Number.
            </div>
            @error('bus_account_number') 
            <div class="invalid-feedback">
                {{ $message }}
            </div> 
            @enderror
          </div>
          <div class="col-md-6">
            <label class="form-label required">Registration Number</label>
            <input type="text" name="bus_reg_num" class="form-control"  placeholder="Enter a Registration Number" value="{{ old('bus_reg_num', $config->bus_reg_num ?? '') }}" required>
            <div class="invalid-feedback">
                Please Enter Business Register Number.
            </div>
            @error('bus_reg_num') 
            <div class="invalid-feedback">
                {{ $message }}
            </div> 
            @enderror
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-md-6">
            <label class="form-label required">Contact Number</label>
            <input type="text" name="bus_contact_num" placeholder="Enter a Contact Number" class="form-control" value="{{ old('bus_contact_num', $config->bus_contact_num ?? '') }}" required>
            <div class="invalid-feedback">
                Please Enter Contact Number.
            </div>
            @error('bus_contact_num') 
            <div class="invalid-feedback">
                {{ $message }}
            </div> 
            @enderror
          </div>
          <div class="col-md-6">
            <label class="form-label required">Contact Person</label>
            <input type="text" name="bus_contact_person" class="form-control" placeholder="Enter a Contact Person" value="{{ old('bus_contact_person', $config->bus_contact_person ?? '') }}" required>
            <div class="invalid-feedback">
                Please Enter Contact Person.
            </div>
            @error('bus_contact_person') 
            <div class="invalid-feedback">
                {{ $message }}
            </div> 
            @enderror
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-md-6">
            <label class="form-label required">IBAN</label>
            <input type="text" name="bus_IBAN" class="form-control" placeholder="Enter a IBAN" value="{{ old('bus_IBAN', $config->bus_IBAN ?? '') }}" required>
            <div class="invalid-feedback">
                Please Enter IBAN.
            </div>
            @error('bus_IBAN') 
            <div class="invalid-feedback">
                {{ $message }}
            </div> 
            @enderror
          </div>
          <div class="col-md-6">
            <label class="form-label required">SWIFT Code</label>
            <input type="text" name="bus_swift_code" placeholder="Enter a SWIFT Code" class="form-control" value="{{ old('bus_swift_code', $config->bus_swift_code ?? '') }}">
            <div class="invalid-feedback" required>
                Please Enter SWIFT Code.
            </div>
            @error('bus_swift_code') 
            <div class="invalid-feedback">
                {{ $message }}
            </div> 
            @enderror
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-md-6">
            <label class="form-label required">Branch Name</label>
            <input type="text" name="bus_acc_branch_name" placeholder="Enter a Branch Name" class="form-control" value="{{ old('bus_acc_branch_name', $config->bus_acc_branch_name ?? '') }}" required>
            <div class="invalid-feedback">
                Please Enter Branch Name.
            </div>
            @error('bus_acc_branch_name') 
            <div class="invalid-feedback">
                {{ $message }}
            </div> 
            @enderror
          </div>
          <div class="col-md-6">
            <label class="form-label">Branch Code</label>
            <input type="text" name="bus_acc_branch_code" placeholder="Enter a Branch Code" class="form-control" value="{{ old('bus_acc_branch_code', $config->bus_acc_branch_code ?? '') }}" required>
            <div class="invalid-feedback">
                Please Enter Branch Code.
            </div>
            @error('bus_acc_branch_code') 
            <div class="invalid-feedback">
                {{ $message }}
            </div> 
            @enderror
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-md-6">
            <label class="form-label required">Company Logo</label>
            <input type="file" name="bus_logo" class="form-control" required>
            @if(!empty($config->bus_logo))
            <div class="mt-3">
                <img src="{{ asset('uploads/company/' . $config->bus_logo) }}"
                    alt="Company Logo"
                    style="max-width: 200px; height: auto; border: 1px solid #ddd; padding: 5px; border-radius: 8px; box-shadow: 0 2px 6px rgba(0,0,0,0.1);">
            </div>
            @endif
            <div class="invalid-feedback">
                Please Enter Comapny Logo.
            </div>
            @error('bus_logo') 
            <div class="invalid-feedback">
                {{ $message }}
            </div> 
            @enderror
          </div>
        </div>
        <div class="text-end">
          <button type="submit" class="btn btn-primary">{{ __('Save Configuration') }}</button>
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
