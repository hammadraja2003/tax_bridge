@extends('layouts.admin')
@section('content')
    <div class="container-fluid">
        <h2 class="mb-4 text-center">Configuration</h2>
        {{-- Tampering check notice (at page end) --}}
        <div class="mt-4 text-end">
            @if ($config && $config->tampered)
                <span class="text-danger fw-bold">⚠ Data tampered!</span>
            @endif
        </div>
        <form class="app-form needs-validation" novalidate method="POST" action="{{ route('company.configuration.save') }}"
            enctype="multipart/form-data">
            @csrf
            <div class="card mb-4">
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label class="form-label required">Name</label>
                            <input type="text" name="bus_name" placeholder="Enter a Buissness Name" class="form-control"
                                required value="{{ old('bus_name', $config->bus_name ?? '') }}">
                            <div class="invalid-feedback">
                                Please Enter Business Configuration.
                            </div>
                            @error('bus_name')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                        <div class="col-md-4">
                            <label class="form-label required">Select NTN / CNIC</label>
                            <select name="id_type" id="id_type" class="form-select" required>
                                <option value="NTN"
                                    {{ (old('id_type') ?? (isset($config) && strlen($config->bus_ntn_cnic) == 7 ? 'NTN' : 'CNIC')) == 'NTN' ? 'selected' : '' }}>
                                    NTN
                                </option>
                                <option value="CNIC"
                                    {{ (old('id_type') ?? (isset($config) && strlen($config->bus_ntn_cnic) == 13 ? 'CNIC' : 'NTN')) == 'CNIC' ? 'selected' : '' }}>
                                    CNIC
                                </option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label required">NTN / CNIC</label>
                            <input type="text" name="bus_ntn_cnic" id="bus_ntn_cnic" placeholder="Enter a NTN / CNIC"
                                class="form-control" required
                                value="{{ old('bus_ntn_cnic', $config->bus_ntn_cnic ?? '') }}">
                            <div class="invalid-feedback">Please Enter Business NTN/CNIC.</div>
                            @error('bus_ntn_cnic')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="col-md-4">
                            <label class="form-label required">Registration #</label>
                            <input type="text" name="bus_reg_num" placeholder="Enter a Registration #"
                                class="form-control" required value="{{ old('bus_reg_num', $config->bus_reg_num ?? '') }}">
                            <div class="invalid-feedback">Please Enter Business Registration.</div>
                            @error('bus_reg_num')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label class="form-label required">Contact Number</label>
                            <input type="text" name="bus_contact_num" placeholder="Enter a Contact Number"
                                class="form-control" value="{{ old('bus_contact_num', $config->bus_contact_num ?? '') }}"
                                required>
                            <div class="invalid-feedback">
                                Please Enter Contact Number.
                            </div>
                            @error('bus_contact_num')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                        <div class="col-md-4">
                            <label class="form-label required">Contact Person</label>
                            <input type="text" name="bus_contact_person" class="form-control"
                                placeholder="Enter a Contact Person"
                                value="{{ old('bus_contact_person', $config->bus_contact_person ?? '') }}" required>
                            <div class="invalid-feedback">
                                Please Enter Contact Person.
                            </div>
                            @error('bus_contact_person')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                        <div class="col-md-4">
                            <label for="bus_province" class="form-label required">Province</label>
                            <select name="bus_province" id="bus_province"
                                class="form-select @error('bus_province') is-invalid @enderror" required>
                                <option value="">-- Select Province --</option>
                                <option value="Punjab"
                                    {{ old('bus_province', $config->bus_province ?? '') == 'Punjab' ? 'selected' : '' }}>
                                    Punjab</option>
                                <option value="Sindh"
                                    {{ old('bus_province', $config->bus_province ?? '') == 'Sindh' ? 'selected' : '' }}>
                                    Sindh</option>
                                <option value="Khyber Pakhtunkhwa"
                                    {{ old('bus_province', $config->bus_province ?? '') == 'Khyber Pakhtunkhwa' ? 'selected' : '' }}>
                                    Khyber Pakhtunkhwa</option>
                                <option value="Balochistan"
                                    {{ old('bus_province', $config->bus_province ?? '') == 'Balochistan' ? 'selected' : '' }}>
                                    Balochistan</option>
                                {{-- <option value="Gilgit-Baltistan" {{ old('bus_province', $config->bus_province ?? '') == 'Gilgit-Baltistan' ? 'selected' : '' }}>Gilgit-Baltistan</option>
        <option value="Islamabad Capital Territory" {{ old('bus_province', $config->bus_province ?? '') == 'Islamabad Capital Territory' ? 'selected' : '' }}>Islamabad Capital Territory</option>
        <option value="Azad Jammu and Kashmir" {{ old('bus_province', $config->bus_province ?? '') == 'Azad Jammu and Kashmir' ? 'selected' : '' }}>Azad Jammu and Kashmir</option> --}}
                            </select>
                            <div class="invalid-feedback">Please select Province.</div>
                            @error('bus_province')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
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
                            <label class="form-label required">Bank Branch Name</label>
                            <input type="text" name="bus_acc_branch_name" placeholder="Enter a Branch Name"
                                class="form-control"
                                value="{{ old('bus_acc_branch_name', $config->bus_acc_branch_name ?? '') }}" required>
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
                            <label class="form-label required">Bank Branch Code</label>
                            <input type="text" name="bus_acc_branch_code" placeholder="Enter a Branch Code"
                                class="form-control"
                                value="{{ old('bus_acc_branch_code', $config->bus_acc_branch_code ?? '') }}" required>
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
                        <div class="col-md-3">
                            <label class="form-label required">Bank Account Number</label>
                            <input type="text" name="bus_account_number" class="form-control"
                                placeholder="Enter a Account Number"
                                value="{{ old('bus_account_number', $config->bus_account_number ?? '') }}" required>
                            <div class="invalid-feedback">
                                Please Enter Account Number.
                            </div>
                            @error('bus_account_number')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                        <div class="col-md-3">
                            <label class="form-label required">Account Title</label>
                            <input type="text" name="bus_account_title" class="form-control"
                                placeholder="Enter a Account Title"
                                value="{{ old('bus_account_title', $config->bus_account_title ?? '') }}" required>
                            <div class="invalid-feedback">
                                Please Enter Account Title.
                            </div>
                            @error('bus_account_title')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                        <div class="col-md-3">
                            <label class="form-label required">IBAN</label>
                            <input type="text" name="bus_IBAN" class="form-control" placeholder="Enter a IBAN"
                                value="{{ old('bus_IBAN', $config->bus_IBAN ?? '') }}" required>
                            <div class="invalid-feedback">
                                Please Enter IBAN.
                            </div>
                            @error('bus_IBAN')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">SWIFT Code</label>
                            <input type="text" name="bus_swift_code" placeholder="Enter a SWIFT Code"
                                class="form-control" value="{{ old('bus_swift_code', $config->bus_swift_code ?? '') }}">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label {{ empty($config->bus_logo) ? 'required' : '' }}">Company
                                Logo</label>
                            <input type="file" name="bus_logo" class="form-control"
                                {{ empty($config->bus_logo) ? 'required' : '' }}>
                            @if (!empty($config->bus_logo))
                                <div class="mt-3">
                                    <img src="{{ asset('uploads/company/' . $config->bus_logo) }}" alt="Company Logo"
                                        style="max-width: 200px; height: auto; border: 1px solid #ddd; padding: 5px; border-radius: 8px; box-shadow: 0 2px 6px rgba(0,0,0,0.1);">
                                </div>
                            @endif
                            <div class="invalid-feedback">
                                Please Enter Company Logo.
                            </div>
                            @error('bus_logo')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                    </div>
                    <div class="text-end">
                        <button type="submit" class="btn btn-primary">Save Configuration</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    @push('scripts')
        <script nonce="{{ $nonce }}">
            document.addEventListener('DOMContentLoaded', function() {
                const typeSelect = document.getElementById('id_type');
                const input = document.getElementById('bus_ntn_cnic');
                if (!typeSelect || !input) return; // Prevent error if elements don't exist
                function applyValidation() {
                    const val = input.value.trim();
                    const isNTN = typeSelect.value === 'NTN';
                    // Define regex patterns
                    const patternNTN = /^[0-9]{7}$/;
                    const patternCNIC = /^[0-9]{13}$/;
                    // Clear input only if current value does NOT match the new pattern
                    if ((isNTN && !patternNTN.test(val)) || (!isNTN && !patternCNIC.test(val))) {
                        input.value = "";
                    }
                    // Apply attributes
                    if (isNTN) {
                        input.setAttribute('pattern', '[0-9]{7}');
                        input.setAttribute('maxlength', '7');
                        input.setAttribute('title', 'NTN must be exactly 7 digits');
                        input.placeholder = 'Enter 7-digit NTN';
                    } else {
                        input.setAttribute('pattern', '[0-9]{13}');
                        input.setAttribute('maxlength', '13');
                        input.setAttribute('title', 'CNIC must be exactly 13 digits (without dashes)');
                        input.placeholder = 'Enter 13-digit CNIC';
                    }
                }
                typeSelect.addEventListener('change', applyValidation);
                applyValidation();
            });
        </script>
    @endpush
@endsection
