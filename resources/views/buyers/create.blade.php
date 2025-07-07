@extends('layouts.admin')

@section('content')
@include('layouts.partials.errors')
<div class="container">
  <h2 class="mb-4 text-center">Add New Buyer</h2>
  <form class="app-form needs-validation" novalidate method="POST" action="{{ route('buyers.store') }}" enctype="multipart/form-data">
    @csrf
    <div class="card mb-4">
      <div class="card-body row g-3">
         <div class="col-md-6">
            <label class="form-label">Buyer Name</label>
            <input type="text" name="byr_name" placeholder="Enter a Buyer Name" class="form-control" required/>
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
                <option value="1" {{ old('byr_type') == '1' ? 'selected' : '' }}>Registered</option>
                <option value="0" {{ old('byr_type') == '0' ? 'selected' : '' }}>Unregistered</option>
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
          <input type="text" name="byr_ntn_cnic" placeholder="Enter a NTN/CNIC"  class="form-control" required />
          <div class="invalid-feedback">
                Please Enter NTN/CNIC.
            </div>
            @error('byr_ntn_cnic')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>

       
        <div class="col-md-6">
          <label class="form-label">Account Number</label>
          <input type="text" name="byr_account_number" placeholder="Enter a Account Number" class="form-control" required />
            <div class="invalid-feedback">
                Please Enter Account Number.
            </div>
            @error('byr_account_number')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>

        <div class="col-md-6">
          <label class="form-label">Registration Number</label>
          <input type="text" name="byr_reg_num" placeholder="Enter a Registration Number" class="form-control" required />
            <div class="invalid-feedback">
                Please Enter Registration Number.
            </div>
            @error('byr_reg_num')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>

        <div class="col-md-6">
          <label class="form-label">Contact Number</label>
          <input type="text" name="byr_contact_num" placeholder="Enter a Contact Number" class="form-control" required />
            <div class="invalid-feedback">
                Please Enter Contact Number.
            </div>
            @error('byr_contact_num')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>

        <div class="col-md-6">
          <label class="form-label">Contact Person</label>
          <input type="text" name="byr_contact_person" placeholder="Enter a Contact Person" class="form-control" required />
            <div class="invalid-feedback">
                Please Enter Contact Person.
            </div>
            @error('byr_contact_person')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>

        <div class="col-md-6">
          <label class="form-label">IBAN</label>
          <input type="text" name="byr_IBAN" placeholder="Enter a IBAN" class="form-control" required />
            <div class="invalid-feedback">
                Please Enter IBAN.
            </div>
            @error('byr_IBAN')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>

        <div class="col-md-6">
          <label class="form-label">SWIFT Code</label>
          <input type="text" name="byr_swift_code" placeholder="Enter a SWIFT Code" class="form-control" required />
            <div class="invalid-feedback">
                Please Enter SWIFT Code.
            </div>
            @error('byr_swift_code')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-md-6">
          <label class="form-label">Branch Code</label>
          <input type="text" name="byr_acc_branch_code" placeholder="Enter a Branch Code" class="form-control" required />
            <div class="invalid-feedback">
                Please Enter Branch Code.
            </div>
            @error('byr_acc_branch_code')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-md-6">
          <label class="form-label">Branch Name</label>
          <input type="text" name="byr_acc_branch_name" placeholder="Enter a Branch Name" class="form-control" required />
            <div class="invalid-feedback">
                Please Enter Branch Name.
            </div>
            @error('byr_acc_branch_name')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>

        <div class="col-md-6">
          <label class="form-label">Buyer Logo (optional)</label>
          <input type="file" name="byr_logo" class="form-control" required />
                @if(isset($buyer->byr_logo))
                    <img src="{{ asset('storage/buyers/' . $buyer->byr_logo) }}" alt="Logo" width="100" class="mt-2">
                @endif
            <div class="invalid-feedback">
                Please Enter Buyer Logo.
            </div>
            @error('byr_logo')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
       
        <div class="col-md-12">
          <label class="form-label">Address</label>
          <textarea name="byr_address" class="form-control" placeholder="Enter a Address" required></textarea>
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
                    {{ __('Save Buyer') }}
                </button>
            </div>
        </div>
    </form>
       

      </div>
    </div>
</div>
@endsection
