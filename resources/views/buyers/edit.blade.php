@extends('layouts.admin')

@section('content')
<div class="container">
    <h3>Edit Buyer</h3>
    <form action="{{ route('buyers.update', $buyer->byr_id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="row">
            <div class="col-md-6 mb-3">
                <label>Name</label>
                <input name="byr_name" class="form-control" value="{{ $buyer->byr_name }}" required>
            </div>
            <div class="col-md-6 mb-3">
                <label>Type</label>
                <select name="byr_type" class="form-control" required>
                    <option value="1" {{ $buyer->byr_type == 1 ? 'selected' : '' }}>Registered</option>
                    <option value="0" {{ $buyer->byr_type == 0 ? 'selected' : '' }}>Unregistered</option>
                </select>
            </div>
            <div class="col-md-6 mb-3">
                <label>NTN/CNIC</label>
                <input name="byr_ntn_cnic" class="form-control" value="{{ $buyer->byr_ntn_cnic }}">
            </div>
            <div class="col-md-6 mb-3">
                <label>Account Number</label>
                <input name="byr_account_number" class="form-control" value="{{ $buyer->byr_account_number }}">
            </div>
            <div class="col-md-6 mb-3">
                <label>Registration Number</label>
                <input name="byr_reg_num" class="form-control" value="{{ $buyer->byr_reg_num }}">
            </div>
            <div class="col-md-6 mb-3">
                <label>Contact Number</label>
                <input name="byr_contact_num" class="form-control" value="{{ $buyer->byr_contact_num }}">
            </div>
            <div class="col-md-6 mb-3">
                <label>Contact Person</label>
                <input name="byr_contact_person" class="form-control" value="{{ $buyer->byr_contact_person }}">
            </div>
            <div class="col-md-6 mb-3">
                <label>IBAN</label>
                <input name="byr_IBAN" class="form-control" value="{{ $buyer->byr_IBAN }}">
            </div>
            <div class="col-md-6 mb-3">
                <label>SWIFT Code</label>
                <input name="byr_swift_code" class="form-control" value="{{ $buyer->byr_swift_code }}">
            </div>
            <div class="col-md-6 mb-3">
                <label>Branch Name</label>
                <input name="byr_acc_branch_name" class="form-control" value="{{ $buyer->byr_acc_branch_name }}">
            </div>
            <div class="col-md-6 mb-3">
                <label>Branch Code</label>
                <input name="byr_acc_branch_code" class="form-control" value="{{ $buyer->byr_acc_branch_code }}">
            </div>
            <div class="col-md-12 mb-3">
                <label>Address</label>
                <textarea name="byr_address" class="form-control">{{ $buyer->byr_address }}</textarea>
            </div>
            <div class="col-md-6 mb-3">
                <label>Buyer Logo (optional)</label>
                <input type="file" name="byr_logo" class="form-control">
                @if(isset($buyer->byr_logo))
                    <img src="{{ asset('storage/buyers/' . $buyer->byr_logo) }}" alt="Logo" width="100" class="mt-2">
                @endif
            </div>
            
        </div>
        <button class="btn btn-primary">Update Buyer</button>
        <a href="{{ route('buyers.index') }}" class="btn btn-secondary">Back</a>
    </form>
</div>
@endsection
