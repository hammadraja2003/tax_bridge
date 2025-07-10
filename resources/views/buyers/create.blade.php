@extends('layouts.admin')
@section('content')

<div class="container">
  <h2 class="mb-4 text-center">Add New Client</h2>
  <form class="app-form needs-validation" novalidate method="POST" action="{{ route('buyers.store') }}" enctype="multipart/form-data">
    @csrf
    <div class="card mb-4">
      <div class="card-body row g-3">
         <div class="col-md-6">
            <label class="form-label required">Client Name</label>
            <input type="text" name="byr_name" placeholder="Enter a Client Name" class="form-control" required/>
                <div class="invalid-feedback">
                    Please Enter Client Name.
                </div>
                @error('byr_name')
                <div class="invalid-feedback">{{ $message }}</div>
                @enderror
         </div>
         <div class="col-md-6">
            <label class="form-label required">Client Type</label>
            <select name="byr_type"
                    class="form-select @error('byr_type') is-invalid @enderror"
                    required>
                <option value="">-- Select Client Type --</option>
                <option value="1" {{ old('byr_type') == '1' ? 'selected' : '' }}>Registered</option>
                <option value="0" {{ old('byr_type') == '0' ? 'selected' : '' }}>Unregistered</option>
            </select>
            <div class="invalid-feedback">
                Please select a Client Type.
            </div>
            @error('byr_type')
                <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-md-6">
        <label class="form-label required">NTN / CNIC</label>
          <input type="text" name="byr_ntn_cnic" placeholder="Enter a NTN/CNIC"  class="form-control" required />
          <div class="invalid-feedback">
                Please Enter NTN/CNIC.
            </div>
            @error('byr_ntn_cnic')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-md-6">
        <label class="form-label required">Registration Number</label>
        <input type="text" name="byr_reg_num" placeholder="Enter a Registration Number" class="form-control" required />
            <div class="invalid-feedback">
                Please Enter Registration Number.
            </div>
            @error('byr_reg_num')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-md-4">
            <label class="form-label required">Contact Number</label>
            <input type="text" name="byr_contact_num" placeholder="Enter a Contact Number" class="form-control" required />
              <div class="invalid-feedback">
                  Please Enter Contact Number.
              </div>
              @error('byr_contact_num')
              <div class="invalid-feedback">{{ $message }}</div>
              @enderror
          </div>
          <div class="col-md-4">
            <label class="form-label required">Contact Person</label>
            <input type="text" name="byr_contact_person" placeholder="Enter a Contact Person" class="form-control" required />
              <div class="invalid-feedback">
                  Please Enter Contact Person.
              </div>
              @error('byr_contact_person')
              <div class="invalid-feedback">{{ $message }}</div>
              @enderror
          </div>
          <div class="col-md-4">
              <label class="form-label required">Province</label>
              <input type="text" name="byr_province" class="form-control" placeholder="Enter Province" required>
              <div class="invalid-feedback">
                  Please Enter Province.
              </div>
              @error('byr_province')
                  <div class="invalid-feedback">{{ $message }}</div>
              @enderror
          </div> 
          
        <div class="col-md-12">
            <label class="form-label required">Address</label>
            <textarea name="byr_address" class="form-control" placeholder="Enter a Address" required></textarea>
              <div class="invalid-feedback">
                  Please Enter Address.
              </div>
              @error('byr_address')
              <div class="invalid-feedback">{{ $message }}</div>
              @enderror
          </div>
        <div class="col-md-6">
            <label class="form-label required">Bank Branch Name</label>
            <input type="text" name="byr_acc_branch_name" placeholder="Enter a Branch Name" class="form-control" required />
              <div class="invalid-feedback">
                  Please Enter Branch Name.
              </div>
              @error('byr_acc_branch_name')
              <div class="invalid-feedback">{{ $message }}</div>
              @enderror
          </div>
        <div class="col-md-6">
            <label class="form-label required">Bank Branch Code</label>
            <input type="text" name="byr_acc_branch_code" placeholder="Enter a Branch Code" class="form-control" required/>
            <div class="invalid-feedback">
                  Please Enter Branch Code.
              </div>
              @error('byr_acc_branch_code')
              <div class="invalid-feedback">{{ $message }}</div>
              @enderror
          </div>
          
        <div class="col-md-4">
          <label class="form-label required">Account Title</label>
          <input type="text" name="byr_account_title" placeholder="Enter a Account Title" class="form-control" required />
            <div class="invalid-feedback">
                Please Enter Account Title.
            </div>
            @error('byr_account_title')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-md-4">
          <label class="form-label required">Account Number</label>
          <input type="text" name="byr_account_number" placeholder="Enter a Account Number" class="form-control" required />
            <div class="invalid-feedback">
                Please Enter Account Number.
            </div>
            @error('byr_account_number')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-md-4">
            <label class="form-label required">IBAN</label>
            <input type="text" name="byr_IBAN" placeholder="Enter a IBAN" class="form-control" required />
              <div class="invalid-feedback">
                  Please Enter IBAN.
              </div>
              @error('byr_IBAN')
              <div class="invalid-feedback">{{ $message }}</div>
              @enderror
          </div>
          <div class="col-md-4">
            <label class="form-label">SWIFT Code</label>
            <input type="text" name="byr_swift_code" placeholder="Enter a SWIFT Code" class="form-control" />
          </div>
       
        <div class="col-md-6">
          <label class="form-label required">Client Logo</label>
          <input type="file" name="byr_logo" class="form-control" required />
                @if(isset($buyer->byr_logo))
                    <img src="{{ asset('storage/buyers/' . $buyer->byr_logo) }}" alt="Logo" width="100" class="mt-2">
                @endif
            <div class="invalid-feedback">
                Please Enter Client Logo.
            </div>
            @error('byr_logo')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-md-12 ">
            <div class="mb-3 col-2 mt-3 ms-auto text-end">
                <button type="submit" role="button" class="btn btn-primary w-100">
                    Save Client
                </button>
            </div>
        </div>
        </div>
    </div>
</form>
</div>
</div>


<style>
    .required::after {
        content: ' *';
        color: red;
    }
</style>
@endsection
