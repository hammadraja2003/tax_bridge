@extends('layouts.admin')

@section('content')
<div class="container">
    <h3>Company Configuration</h3>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <form action="{{ route('company.configuration.save') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="row">
            <div class="col-md-6 mb-3">
                <label>Name *</label>
                <input type="text" name="bus_name" class="form-control" required value="{{ old('bus_name', $config->bus_name ?? '') }}">
            </div>
            <div class="col-md-6 mb-3">
                <label>NTN/CNIC *</label>
                <input type="text" name="bus_ntn_cnic" class="form-control" required value="{{ old('bus_ntn_cnic', $config->bus_ntn_cnic ?? '') }}">
            </div>
            <div class="col-md-12 mb-3">
                <label>Address *</label>
                <textarea name="bus_address" class="form-control" required>{{ old('bus_address', $config->bus_address ?? '') }}</textarea>
            </div>

            <div class="col-md-6 mb-3">
                <label>Account Number</label>
                <input type="text" name="bus_account_number" class="form-control" value="{{ old('bus_account_number', $config->bus_account_number ?? '') }}">
            </div>
            <div class="col-md-6 mb-3">
                <label>Registration Number</label>
                <input type="text" name="bus_reg_num" class="form-control" value="{{ old('bus_reg_num', $config->bus_reg_num ?? '') }}">
            </div>

            <div class="col-md-6 mb-3">
                <label>Contact Number</label>
                <input type="text" name="bus_contact_num" class="form-control" value="{{ old('bus_contact_num', $config->bus_contact_num ?? '') }}">
            </div>
            <div class="col-md-6 mb-3">
                <label>Contact Person</label>
                <input type="text" name="bus_contact_person" class="form-control" value="{{ old('bus_contact_person', $config->bus_contact_person ?? '') }}">
            </div>

            <div class="col-md-6 mb-3">
                <label>IBAN</label>
                <input type="text" name="bus_IBAN" class="form-control" value="{{ old('bus_IBAN', $config->bus_IBAN ?? '') }}">
            </div>
            <div class="col-md-6 mb-3">
                <label>SWIFT Code</label>
                <input type="text" name="bus_swift_code" class="form-control" value="{{ old('bus_swift_code', $config->bus_swift_code ?? '') }}">
            </div>
            <div class="col-md-6 mb-3">
                <label>Branch Name</label>
                <input type="text" name="bus_acc_branch_name" class="form-control" value="{{ old('bus_acc_branch_name', $config->bus_acc_branch_name ?? '') }}">
            </div>
            <div class="col-md-6 mb-3">
                <label>Branch Code</label>
                <input type="text" name="bus_acc_branch_code" class="form-control" value="{{ old('bus_acc_branch_code', $config->bus_acc_branch_code ?? '') }}">
            </div>

            <div class="col-md-6 mb-3">
                <label>Company Logo</label>
                <input type="file" name="bus_logo" class="form-control">
                @if(!empty($config->bus_logo))
                    <img src="{{ asset('storage/company/' . $config->bus_logo) }}" alt="Logo" width="100" class="mt-2">
                @endif
            </div>
        </div>

        <button class="btn btn-primary">Save Configuration</button>
    </form>
</div>
@endsection
