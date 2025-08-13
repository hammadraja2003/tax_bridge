@extends('layouts.admin')
@section('content')
    <div class="container-fluid">
        <h2 class="mb-4 text-center">Add New Client</h2>
        {{-- <form class="app-form needs-validation" novalidate method="POST" action="{{ route('buyers.store') }}"
            enctype="multipart/form-data">
            @csrf
            <div class="card mb-4">
                <div class="card-body row g-3">
                    <div class="col-md-6">
                        <label class="form-label required">Client Name</label>
                        <input type="text" name="byr_name" placeholder="Enter a Client Name"
                            value="{{ old('byr_name') }}" class="form-control" required />
                        <div class="invalid-feedback">
                            Please Enter Client Name.
                        </div>
                        @error('byr_name')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-md-6">
                        <label class="form-label required">Client Type</label>
                        <select name="byr_type" class="form-select @error('byr_type') is-invalid @enderror" required>
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
                    <div class="col-md-4">
                        <label class="form-label" for="byr_id_type">Select Buyer NTN / CNIC</label>
                        <select name="byr_id_type" id="byr_id_type" class="form-select">
                            <option value="">
                                Select NTN/CNIC
                            </option>
                            <option value="NTN"
                                {{ (old('byr_id_type') ?? (isset($buyer) && strlen($buyer->byr_ntn_cnic) == 7 ? 'NTN' : 'CNIC')) == 'NTN' ? 'selected' : '' }}>
                                NTN
                            </option>
                            <option value="CNIC"
                                {{ (old('byr_id_type') ?? (isset($buyer) && strlen($buyer->byr_ntn_cnic) == 13 ? 'CNIC' : 'NTN')) == 'CNIC' ? 'selected' : '' }}>
                                CNIC
                            </option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label" for="byr_ntn_cnic">Client NTN / CNIC</label>
                        <input type="text" name="byr_ntn_cnic" id="byr_ntn_cnic" placeholder="Enter a NTN/CNIC"
                            value="{{ old('byr_ntn_cnic') }}" class="form-control" />
                        <div class="invalid-feedback">
                            Please Enter NTN/CNIC.
                        </div>
                        @error('byr_ntn_cnic')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-md-4">
                        <label class="form-label required">Registration Number</label>
                        <input type="text" name="byr_reg_num" placeholder="Enter a Registration Number"
                            value="{{ old('byr_reg_num') }}" class="form-control" required />
                        <div class="invalid-feedback">
                            Please Enter Registration Number.
                        </div>
                        @error('byr_reg_num')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-md-4">
                        <label class="form-label required">Contact Number</label>
                        <input type="text" name="byr_contact_num" placeholder="Enter a Contact Number"
                            value="{{ old('byr_contact_num') }}" class="form-control" required />
                        <div class="invalid-feedback">
                            Please Enter Contact Number.
                        </div>
                        @error('byr_contact_num')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-md-4">
                        <label class="form-label required">Contact Person</label>
                        <input type="text" name="byr_contact_person" placeholder="Enter a Contact Person"
                            value="{{ old('byr_contact_person') }}" class="form-control" required />
                        <div class="invalid-feedback">
                            Please Enter Contact Person.
                        </div>
                        @error('byr_contact_person')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-md-4">
                        <label class="form-label required">Province</label>
                        <input type="text" name="byr_province" value="{{ old('byr_province') }}" class="form-control"
                            placeholder="Enter Province" required>
                        <div class="invalid-feedback">
                            Please Enter Province.
                        </div>
                        @error('byr_province')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-md-12">
                        <label class="form-label required">Address</label>
                        <textarea name="byr_address" value="{{ old('byr_address') }}" class="form-control" placeholder="Enter a Address"
                            required></textarea>
                        <div class="invalid-feedback">
                            Please Enter Address.
                        </div>
                        @error('byr_address')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-md-6">
                        <label class="form-label required">Bank Branch Name</label>
                        <input type="text" name="byr_acc_branch_name" placeholder="Enter a Branch Name"
                            value="{{ old('byr_acc_branch_name') }}" class="form-control" required />
                        <div class="invalid-feedback">
                            Please Enter Branch Name.
                        </div>
                        @error('byr_acc_branch_name')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-md-6">
                        <label class="form-label required">Bank Branch Code</label>
                        <input type="text" name="byr_acc_branch_code" placeholder="Enter a Branch Code"
                            value="{{ old('byr_acc_branch_code') }}" class="form-control" required />
                        <div class="invalid-feedback">
                            Please Enter Branch Code.
                        </div>
                        @error('byr_acc_branch_code')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-md-4">
                        <label class="form-label required">Account Title</label>
                        <input type="text" name="byr_account_title" placeholder="Enter a Account Title"
                            value="{{ old('byr_account_title') }}" class="form-control" required />
                        <div class="invalid-feedback">
                            Please Enter Account Title.
                        </div>
                        @error('byr_account_title')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-md-4">
                        <label class="form-label required">Account Number</label>
                        <input type="text" name="byr_account_number" placeholder="Enter a Account Number"
                            value="{{ old('byr_account_number') }}" class="form-control" required />
                        <div class="invalid-feedback">
                            Please Enter Account Number.
                        </div>
                        @error('byr_account_number')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-md-4">
                        <label class="form-label required">IBAN</label>
                        <input type="text" name="byr_IBAN" placeholder="Enter a IBAN" value="{{ old('byr_IBAN') }}"
                            class="form-control" required />
                        <div class="invalid-feedback">
                            Please Enter IBAN.
                        </div>
                        @error('byr_IBAN')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">SWIFT Code</label>
                        <input type="text" name="byr_swift_code" placeholder="Enter a SWIFT Code"
                            value="{{ old('byr_swift_code') }}" class="form-control" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label required">Client Logo</label>
                        <input type="file" name="byr_logo" value="{{ old('byr_logo') }}" class="form-control"
                            required />
                        @if (isset($buyer->byr_logo))
                            <img src="{{ asset('storage/buyers/' . $buyer->byr_logo) }}" alt="Logo" width="100"
                                class="mt-2">
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
        </form> --}}
        <form class="app-form needs-validation" novalidate action="{{ route('buyers.store') }}" method="POST"
            enctype="multipart/form-data">
            @csrf

            <div class="card mb-4">
                <div class="card-body row g-3">

                    {{-- Client Name --}}
                    <div class="col-md-6">
                        <label for="byr_name" class="form-label required">Client Name</label>
                        <input type="text" name="byr_name" id="byr_name" value="{{ old('byr_name') }}"
                            class="form-control @error('byr_name') is-invalid @enderror" required>
                        @error('byr_name')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    {{-- Client Type --}}
                    <div class="col-md-6">
                        <label for="byr_type" class="form-label required">Client Type</label>
                        <select name="byr_type" id="byr_type" class="form-select @error('byr_type') is-invalid @enderror"
                            required>
                            <option value="">-- Select Client Type --</option>
                            <option value="1" {{ old('byr_type') == '1' ? 'selected' : '' }}>Registered</option>
                            <option value="0" {{ old('byr_type') == '0' ? 'selected' : '' }}>Unregistered</option>
                        </select>
                        @error('byr_type')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    {{-- Client ID Type --}}
                    <div class="col-md-4">
                        <label for="byr_id_type" class="form-label">Client ID Type</label>
                        <select name="byr_id_type" id="byr_id_type"
                            class="form-select @error('byr_id_type') is-invalid @enderror">
                            <option value="">-- Select ID Type --</option>
                            <option value="NTN" {{ old('byr_id_type') == 'NTN' ? 'selected' : '' }}>NTN</option>
                            <option value="CNIC" {{ old('byr_id_type') == 'CNIC' ? 'selected' : '' }}>CNIC</option>
                        </select>
                        @error('byr_id_type')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    {{-- Client NTN/CNIC --}}
                    <div class="col-md-4">
                        <label for="byr_ntn_cnic" class="form-label">Client NTN / CNIC</label>
                        <input type="text" name="byr_ntn_cnic" id="byr_ntn_cnic" value="{{ old('byr_ntn_cnic') }}"
                            class="form-control @error('byr_ntn_cnic') is-invalid @enderror">
                        @error('byr_ntn_cnic')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>


                    {{-- Client Province --}}
                    <div class="col-md-4">
                        <label for="byr_province " class="form-label required">Province</label>
                        <input type="text" name="byr_province" id="byr_province" value="{{ old('byr_province') }}"
                            class="form-control @error('byr_province') is-invalid @enderror" required>
                        @error('byr_province')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    {{-- Client Address --}}
                    <div class="col-md-12">
                        <label for="byr_address" class="form-label required">Client Address</label>
                        <textarea name="byr_address" id="byr_address" class="form-control @error('byr_address') is-invalid @enderror" required
                            rows="3">{{ old('byr_address') }}</textarea>
                        @error('byr_address')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>


                    {{-- Account Title --}}
                    <div class="col-md-4">
                        <label for="byr_account_title" class="form-label required">Account Title</label>
                        <input type="text" name="byr_account_title" id="byr_account_title"
                            value="{{ old('byr_account_title') }}"
                            class="form-control @error('byr_account_title') is-invalid @enderror" required>
                        @error('byr_account_title')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    {{-- Account Number --}}
                    <div class="col-md-4">
                        <label for="byr_account_number" class="form-label required">Account Number</label>
                        <input type="text" name="byr_account_number" id="byr_account_number"
                            value="{{ old('byr_account_number') }}"
                            class="form-control @error('byr_account_number') is-invalid @enderror" required>
                        @error('byr_account_number')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    {{-- Registration Number --}}
                    <div class="col-md-4">
                        <label for="byr_reg_num" class="form-label required">Registration Number</label>
                        <input type="text" name="byr_reg_num" id="byr_reg_num" value="{{ old('byr_reg_num') }}"
                            class="form-control @error('byr_reg_num') is-invalid @enderror" required>
                        @error('byr_reg_num')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    {{-- Contact Number --}}
                    <div class="col-md-4">
                        <label for="byr_contact_num" class="form-label required">Contact Number</label>
                        <input type="text" name="byr_contact_num" id="byr_contact_num"
                            value="{{ old('byr_contact_num') }}"
                            class="form-control @error('byr_contact_num') is-invalid @enderror" required>
                        @error('byr_contact_num')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    {{-- Contact Person --}}
                    <div class="col-md-4">
                        <label for="byr_contact_person" class="form-label required">Contact Person</label>
                        <input type="text" name="byr_contact_person" id="byr_contact_person"
                            value="{{ old('byr_contact_person') }}"
                            class="form-control @error('byr_contact_person') is-invalid @enderror" required>
                        @error('byr_contact_person')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    {{-- IBAN --}}
                    <div class="col-md-4">
                        <label for="byr_IBAN" class="form-label required">IBAN</label>
                        <input type="text" name="byr_IBAN" id="byr_IBAN" value="{{ old('byr_IBAN') }}"
                            class="form-control @error('byr_IBAN') is-invalid @enderror" required>
                        @error('byr_IBAN')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    {{-- Branch Name --}}
                    <div class="col-md-4">
                        <label for="byr_acc_branch_name" class="form-label required">Branch Name</label>
                        <input type="text" name="byr_acc_branch_name" id="byr_acc_branch_name"
                            value="{{ old('byr_acc_branch_name') }}"
                            class="form-control @error('byr_acc_branch_name') is-invalid @enderror" required>
                        @error('byr_acc_branch_name')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    {{-- Branch Code --}}
                    <div class="col-md-4">
                        <label for="byr_acc_branch_code" class="form-label required">Branch Code</label>
                        <input type="text" name="byr_acc_branch_code" id="byr_acc_branch_code"
                            value="{{ old('byr_acc_branch_code') }}"
                            class="form-control @error('byr_acc_branch_code') is-invalid @enderror" required>
                        @error('byr_acc_branch_code')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                    {{-- Swift Code --}}
                    <div class="col-md-4">
                        <label for="byr_swift_code" class="form-label required">Swift Code</label>
                        <input type="text" name="byr_swift_code" id="byr_swift_code"
                            value="{{ old('byr_swift_code') }}"
                            class="form-control @error('byr_swift_code') is-invalid @enderror" required>
                        @error('byr_swift_code')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    {{-- Buyer Logo --}}
                    <div class="col-md-4">
                        <label for="byr_logo" class="form-label required">Buyer Logo</label>
                        <input type="file" name="byr_logo" id="byr_logo"
                            class="form-control @error('byr_logo') is-invalid @enderror" required
                            accept=".jpg,.jpeg,.png,.svg">
                        @error('byr_logo')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    {{-- Submit Button --}}
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
    @push('scripts')
        <script nonce="{{ $nonce }}">
            document.addEventListener('DOMContentLoaded', function() {
                // Buyer field validation
                const buyerTypeSelect = document.getElementById('byr_id_type');
                const buyerInput = document.getElementById('byr_ntn_cnic');
                if (buyerTypeSelect && buyerInput) {
                    function applyBuyerValidation() {
                        const val = buyerInput.value.trim();
                        const isNTN = buyerTypeSelect.value === 'NTN'; // Define regex patterns
                        const patternNTN = /^[0-9]{7}$/;
                        const patternCNIC =
                            /^[0-9]{13}$/; // Clear input only if current value does NOT match the new pattern
                        if ((isNTN && !patternNTN.test(val)) || (!isNTN && !patternCNIC.test(val))) {
                            buyerInput.value = "";
                        } // Apply attributes
                        if (isNTN) {
                            buyerInput.setAttribute('pattern', '[0-9]{7}');
                            buyerInput.setAttribute('maxlength', '7');
                            buyerInput.setAttribute('title', 'NTN must be exactly 7 digits');
                            buyerInput.placeholder = 'Enter 7-digit NTN';
                        } else {
                            buyerInput.setAttribute('pattern', '[0-9]{13}');
                            buyerInput.setAttribute('maxlength', '13');
                            buyerInput.setAttribute('title', 'CNIC must be exactly 13 digits (without dashes)');
                            buyerInput.placeholder = 'Enter 13-digit CNIC';
                        }
                    }
                    buyerTypeSelect.addEventListener('change', applyBuyerValidation);
                    applyBuyerValidation(); // Initialize
                }
            });
        </script>
        <script nonce="{{ $nonce }}">
            document.addEventListener('DOMContentLoaded', function() {
                const clientTypeSelect = document.querySelector('select[name="byr_type"]');
                const ntcInput = document.getElementById('byr_ntn_cnic');
                const label = ntcInput.previousElementSibling;
                const byr_id_typeInput = document.getElementById('byr_id_type');
                const byr_id_typelabel = byr_id_typeInput.previousElementSibling;

                function toggleRequired() {
                    const selectedValue = clientTypeSelect.value;
                    if (selectedValue === '1') { // Registered
                        ntcInput.setAttribute('required', 'required');
                        label.classList.add('required');
                        byr_id_typeInput.setAttribute('required', 'required');
                        byr_id_typelabel.classList.add('required');
                    } else {
                        ntcInput.removeAttribute('required');
                        label.classList.remove('required');
                        byr_id_typeInput.removeAttribute('required');
                        byr_id_typelabel.classList.remove('required');
                    }
                }
                toggleRequired(); // run on page load in case old value present
                clientTypeSelect.addEventListener('change', toggleRequired);
            });
        </script>
    @endpush
@endsection
