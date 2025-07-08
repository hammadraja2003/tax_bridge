@extends('layouts.admin')
@section('content')
@include('layouts.partials.errors')
<div class="container">
  <h2 class="mb-4 text-center">Edit Buyer</h2>
  <form class="app-form needs-validation" novalidate method="POST" action="{{ route('buyers.update', $buyer->byr_id) }}" enctype="multipart/form-data">
    @csrf
    <div class="card mb-4">
      <div class="card-body row g-3">
         <div class="col-md-6">
            <label class="form-label required">Buyer Name</label>
            <input type="text" name="byr_name" placeholder="Enter a Buyer Name" value="{{ $buyer->byr_name }}" class="form-control" required/>
                <div class="invalid-feedback">
                    Please Enter Buyer Name.
                </div>
                @error('byr_name')
                <div class="invalid-feedback">{{ $message }}</div>
                @enderror
         </div>
         <div class="col-md-6">
            <label class="form-label required">Buyer Type</label>
            <select name="byr_type"
                    class="form-select @error('byr_type') is-invalid @enderror"
                    required>
                <option value="">-- Select Buyer Type --</option>
                <option value="1" {{ old('byr_type', $buyer->byr_type ?? '') == '1' ? 'selected' : '' }}>Registered</option>
                <option value="0" {{ old('byr_type', $buyer->byr_type ?? '') == '0' ? 'selected' : '' }}>Unregistered</option>
            </select>
            <div class="invalid-feedback">
                Please select a Buyer Type.
            </div>
            @error('byr_type')
                <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-md-6">
          <label class="form-label required">NTN/CNIC</label>
          <input type="text" name="byr_ntn_cnic" placeholder="Enter a NTN/CNIC" value="{{ $buyer->byr_ntn_cnic }}"  class="form-control" required />
          <div class="invalid-feedback">
                Please Enter NTN/CNIC.
            </div>
            @error('byr_ntn_cnic')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-md-6">
          <label class="form-label required">Account Number</label>
          <input type="text" name="byr_account_number" placeholder="Enter a Account Number" value="{{ $buyer->byr_account_number }}" class="form-control" required />
            <div class="invalid-feedback">
                Please Enter Account Number.
            </div>
            @error('byr_account_number')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-md-6">
          <label class="form-label required">Registration Number</label>
          <input type="text" name="byr_reg_num" placeholder="Enter a Registration Number" class="form-control" value="{{ $buyer->byr_reg_num }}" required  />
            <div class="invalid-feedback">
                Please Enter Registration Number.
            </div>
            @error('byr_reg_num')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-md-6">
          <label class="form-label required">Contact Number</label>
          <input type="text" name="byr_contact_num" placeholder="Enter a Contact Number" class="form-control" value="{{ $buyer->byr_contact_num }}" required />
            <div class="invalid-feedback">
                Please Enter Contact Number.
            </div>
            @error('byr_contact_num')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-md-6">
          <label class="form-label required">Contact Person</label>
          <input type="text" name="byr_contact_person" placeholder="Enter a Contact Person" value="{{ $buyer->byr_contact_person }}" class="form-control" required />
            <div class="invalid-feedback">
                Please Enter Contact Person.
            </div>
            @error('byr_contact_person')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-md-6">
          <label class="form-label required">IBAN</label>
          <input type="text" name="byr_IBAN" placeholder="Enter a IBAN" class="form-control" value="{{ $buyer->byr_IBAN }}" required />
            <div class="invalid-feedback">
                Please Enter IBAN.
            </div>
            @error('byr_IBAN')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-md-6">
          <label class="form-label">SWIFT Code</label>
          <input type="text" name="byr_swift_code" placeholder="Enter a SWIFT Code" value="{{ $buyer->byr_swift_code }}" class="form-control" />
        </div>
        <div class="col-md-6">
          <label class="form-label">Branch Code</label>
          <input type="text" name="byr_acc_branch_code" placeholder="Enter a Branch Code" value="{{ $buyer->byr_acc_branch_code  }}" class="form-control" />
        </div>
        <div class="col-md-6">
          <label class="form-label required">Branch Name</label>
          <input type="text" name="byr_acc_branch_name" placeholder="Enter a Branch Name" value="{{ $buyer->byr_acc_branch_name }}" class="form-control" required />
            <div class="invalid-feedback">
                Please Enter Branch Name.
            </div>
            @error('byr_acc_branch_name')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-md-6">
          <label class="form-label required">Province</label>
          <input type="text" name="byr_province" class="form-control" placeholder="Enter Province" value="{{ $buyer->byr_province ?? old('byr_province') }}" required>
          <div class="invalid-feedback">
              Please enter Province.
          </div>
          @error('byr_province')
          <div class="invalid-feedback">{{ $message }}</div>
          @enderror
      </div>
        <div class="col-md-6">
            <label class="form-label required">Buyer Logo</label>
            <input type="file" name="byr_logo" class="form-control" />
            @if(isset($buyer->byr_logo))
                <div class="mt-3">
                <img src="{{ asset('uploads/buyer_images/' . $buyer->byr_logo) }}"
                    alt="Company Logo"
                    style="max-width: 200px; height: auto; border: 1px solid #ddd; padding: 5px; border-radius: 8px; box-shadow: 0 2px 6px rgba(0,0,0,0.1);">
            </div>
            @endif
            @error('byr_logo')
                <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-md-12">
          <label class="form-label required">Address</label>
          <textarea name="byr_address" class="form-control" placeholder="Enter a Address" required>{{ $buyer->byr_address }}</textarea>
            <div class="invalid-feedback">
                Please Enter Address.
            </div>
            @error('byr_address')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
      
        <div class="col-2 mt-3 ms-auto text-end">
            <div class="mb-3">
                <button type="submit" role="button" class="btn btn-primary w-100">
                    {{ __('Update Buyer') }}
                </button>
            </div>
        </div>
    </form>
      </div>
    </div>
</div>
<style>
    .required::after {
        content: ' *';
        color: red;
    }
</style>
@endsection
