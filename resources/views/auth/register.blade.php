@extends('layouts.login')
@section('content')
    <style>
        .required::after {
            content: " *";
            color: red;
        }

        @media (min-width: 1200px) {
            .card-body {
                min-height: 520px;
                /* adjust karein apne content ke hisaab se */
            }
        }

        @media (min-width: 1200px) {
            .card {
                min-height: 620px;
            }
        }
    </style>
    @if (session('toast_error'))
        <script>
            toastr.error("{{ session('toast_error') }}", "Error", {
                closeButton: true,
                progressBar: true
            });
        </script>
    @endif
    <div class="col-12 py-5 bg-white">
        <div class="mb-5 text-center text-lg-start">
            <div class="d-flex justify-content-center align-items-center my-2">
                <img src="assets/images/logo/secureism_logo.svg" style="margin: bottom 2px;width:20%;" alt="#"
                    class="dark-logo">
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h5>Basic Configuration Form</h5>
                </div>
                @if ($errors->any())
                    <div class="alert alert-danger">
                        <ul class="mb-0">
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <div class="card-body">
                    {{-- <form action="{{ route('register') }}" method="POST" enctype="multipart/form-data"
                        class="app-form needs-validation"> --}}

                    <form class="app-form needs-validation" novalidate action="{{ route('register') }}" method="POST"
                        enctype="multipart/form-data">
                        @csrf
                        <div class="form-wizard">
                            <div class="row">
                                <!-- Left Side Navigation -->
                                <div class="col-xl-3 mb-3">
                                    <div class="nav navstpes flex-column" id="Basic" role="tablist">
                                        <button class="nav-link active" id="v-features-tab" data-bs-toggle="tab"
                                            data-bs-target="#v-features-tab-pane" type="button" role="tab">
                                            <i class="ti ti-info-circle pe-2"></i>
                                            <span>Company Details</span>
                                        </button>
                                        <button class="nav-link" id="v-history-tab" data-bs-toggle="tab"
                                            data-bs-target="#v-history-tab-pane" type="button" role="tab">
                                            <i class="ti ti-building-bank pe-2"></i>
                                            <span>Bank Details</span>
                                        </button>
                                        <button class="nav-link" id="v-reviews-tab" data-bs-toggle="tab"
                                            data-bs-target="#v-reviews-tab-pane" type="button" role="tab">
                                            <i class="ti ti ti-settings pe-2"></i>
                                            <span>Configuration Details</span>
                                        </button>
                                        <button class="nav-link" id="v-reviews-tab1" data-bs-toggle="tab"
                                            data-bs-target="#v-reviews-tab-pane1" type="button" role="tab">
                                            <i class="ti ti-user-circle pe-2"></i>
                                            <span>User Details</span>
                                        </button>
                                    </div>
                                </div>

                                <!-- Right Side Content -->
                                <div class="col-xl-9">
                                    <div class="tab-content" id="BasicContent">

                                        <!-- Company Details -->
                                        <div class="tab-pane fade show active" id="v-features-tab-pane" role="tabpanel">
                                            <div class="row g-3">

                                                <!-- Business Name -->
                                                <div class="col-md-4">
                                                    <label class="form-label required">Business Name</label>
                                                    <input type="text" name="bus_name"
                                                        class="form-control @error('bus_name') is-invalid @enderror"
                                                        value="{{ old('bus_name') }}" required
                                                        placeholder="Enter Business Name">
                                                    <div class="invalid-feedback">
                                                        @error('bus_name')
                                                            {{ $message }}
                                                        @else
                                                            Please Enter Business Name.
                                                        @enderror
                                                    </div>
                                                </div>

                                                <!-- Select NTN / CNIC -->
                                                <div class="col-md-4">
                                                    <label class="form-label required">Select NTN / CNIC</label>
                                                    <select name="id_type" id="id_type"
                                                        class="form-select @error('id_type') is-invalid @enderror" required>
                                                        <option value="NTN"
                                                            {{ old('id_type', 'NTN') === 'NTN' ? 'selected' : '' }}>NTN
                                                        </option>
                                                        <option value="CNIC"
                                                            {{ old('id_type') === 'CNIC' ? 'selected' : '' }}>CNIC</option>
                                                    </select>
                                                    <div class="invalid-feedback">
                                                        @error('id_type')
                                                            {{ $message }}
                                                        @else
                                                            Please select ID type.
                                                        @enderror
                                                    </div>
                                                </div>

                                                <!-- NTN / CNIC Value -->
                                                <div class="col-md-4">
                                                    <label class="form-label required">NTN / CNIC</label>
                                                    <input type="text" name="bus_ntn_cnic" id="bus_ntn_cnic"
                                                        class="form-control @error('bus_ntn_cnic') is-invalid @enderror"
                                                        value="{{ old('bus_ntn_cnic') }}" required
                                                        placeholder="Enter your NTN / CNIC Number">
                                                    <div class="invalid-feedback">
                                                        @error('bus_ntn_cnic')
                                                            {{ $message }}
                                                        @else
                                                            Please Enter Business NTN/CNIC.
                                                        @enderror
                                                    </div>
                                                </div>


                                                <!-- Registration -->
                                                <div class="col-md-4">
                                                    <label class="form-label required">Registration #</label>
                                                    <input type="text" name="bus_reg_num"
                                                        class="form-control @error('bus_reg_num') is-invalid @enderror"
                                                        value="{{ old('bus_reg_num') }}" required
                                                        placeholder="Enter your Registration Number">
                                                    <div class="invalid-feedback">
                                                        @error('bus_reg_num')
                                                            {{ $message }}
                                                        @else
                                                            Please Enter Business Registration.
                                                        @enderror
                                                    </div>
                                                </div>

                                                <!-- Contact Number -->
                                                <div class="col-md-4">
                                                    <label class="form-label required">Contact Number</label>
                                                    <input type="text" name="bus_contact_num"
                                                        class="form-control @error('bus_contact_num') is-invalid @enderror"
                                                        value="{{ old('bus_contact_num') }}" required
                                                        placeholder="Enter Contact Number">
                                                    <div class="invalid-feedback">
                                                        @error('bus_contact_num')
                                                            {{ $message }}
                                                        @else
                                                            Please Enter Contact Number.
                                                        @enderror
                                                    </div>
                                                </div>

                                                <!-- Contact Person -->
                                                <div class="col-md-4">
                                                    <label class="form-label required">Contact Person</label>
                                                    <input type="text" name="bus_contact_person"
                                                        class="form-control @error('bus_contact_person') is-invalid @enderror"
                                                        value="{{ old('bus_contact_person') }}" required
                                                        placeholder="Enter Contact Person">
                                                    <div class="invalid-feedback">
                                                        @error('bus_contact_person')
                                                            {{ $message }}
                                                        @else
                                                            Please Enter Contact Person.
                                                        @enderror
                                                    </div>
                                                </div>

                                                <!-- Province -->
                                                <div class="col-md-4">
                                                    <label for="bus_province" class="form-label required">Province</label>
                                                    <select name="bus_province"
                                                        class="form-select @error('bus_province') is-invalid @enderror"
                                                        required>
                                                        <option value="">-- Select Province --</option>
                                                        <option value="Punjab"
                                                            {{ old('bus_province') == 'Punjab' ? 'selected' : '' }}>
                                                            Punjab</option>
                                                        <option value="Sindh"
                                                            {{ old('bus_province') == 'Sindh' ? 'selected' : '' }}>
                                                            Sindh</option>
                                                        <option value="Khyber Pakhtunkhwa"
                                                            {{ old('bus_province') == 'Khyber Pakhtunkhwa' ? 'selected' : '' }}>
                                                            Khyber Pakhtunkhwa</option>
                                                        <option value="Balochistan"
                                                            {{ old('bus_province') == 'Balochistan' ? 'selected' : '' }}>
                                                            Balochistan</option>
                                                    </select>
                                                    <div class="invalid-feedback">
                                                        @error('bus_province')
                                                            {{ $message }}
                                                        @else
                                                            Please select Province.
                                                        @enderror
                                                    </div>
                                                </div>

                                                <!-- Logo -->
                                                <div class="col-md-4">
                                                    <label class="form-label required">Company
                                                        Logo</label>
                                                    <input type="file" name="bus_logo"
                                                        class="form-control @error('bus_logo') is-invalid @enderror"
                                                        required>
                                                    <div class="invalid-feedback">
                                                        @error('bus_logo')
                                                            {{ $message }}
                                                        @else
                                                            Please Upload Company Logo.
                                                        @enderror
                                                    </div>
                                                </div>

                                                <!-- Address -->
                                                <div class="col-md-12">
                                                    <label class="form-label required">Business Address</label>
                                                    <textarea name="bus_address" class="form-control @error('bus_address') is-invalid @enderror"
                                                        placeholder="Enter Business Address" rows="3" required>{{ old('bus_address') }}</textarea>
                                                    <div class="invalid-feedback">
                                                        @error('bus_address')
                                                            {{ $message }}
                                                        @else
                                                            Please Enter your Business Address.
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Bank Details -->
                                        <div class="tab-pane fade" id="v-history-tab-pane" role="tabpanel">
                                            <div class="row g-3">
                                                <div class="col-md-4">
                                                    <label class="form-label required">Branch Name</label>
                                                    <input type="text" name="bus_acc_branch_name"
                                                        class="form-control @error('bus_acc_branch_name') is-invalid @enderror"
                                                        value="{{ old('bus_acc_branch_name') }}"
                                                        placeholder="Enter your Branch Name" required>
                                                    <div class="invalid-feedback">
                                                        @error('bus_acc_branch_name')
                                                            {{ $message }}
                                                        @else
                                                            Please Enter Branch Name.
                                                        @enderror
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <label class="form-label required">Branch Code</label>
                                                    <input type="text" name="bus_acc_branch_code"
                                                        class="form-control @error('bus_acc_branch_code') is-invalid @enderror"
                                                        value="{{ old('bus_acc_branch_code') }}"
                                                        placeholder="Enter your Branch Code" required>
                                                    <div class="invalid-feedback">
                                                        @error('bus_acc_branch_code')
                                                            {{ $message }}
                                                        @else
                                                            Please Enter Branch Code.
                                                        @enderror
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <label class="form-label required">Account Title</label>
                                                    <input type="text" name="bus_account_title"
                                                        class="form-control @error('bus_account_title') is-invalid @enderror"
                                                        value="{{ old('bus_account_title') }}"
                                                        placeholder="Enter your Account Title" required>
                                                    <div class="invalid-feedback">
                                                        @error('bus_account_title')
                                                            {{ $message }}
                                                        @else
                                                            Please Enter Account Title.
                                                        @enderror
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <label class="form-label required">Account Number</label>
                                                    <input type="text" name="bus_account_number"
                                                        class="form-control @error('bus_account_number') is-invalid @enderror"
                                                        value="{{ old('bus_account_number') }}"
                                                        placeholder="Enter your Account Number" required>

                                                    <div class="invalid-feedback">
                                                        @error('bus_account_number')
                                                            {{ $message }}
                                                        @else
                                                            Please Enter Account Number.
                                                        @enderror
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <label class="form-label required">IBAN</label>
                                                    <input type="text" name="bus_IBAN"
                                                        class="form-control @error('bus_IBAN') is-invalid @enderror"
                                                        value="{{ old('bus_IBAN') }}" placeholder="Enter your IBAN"
                                                        required>
                                                    <div class="invalid-feedback">
                                                        @error('bus_IBAN')
                                                            {{ $message }}
                                                        @else
                                                            Please Enter IBAN.
                                                        @enderror
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <label class="form-label">Swift Code</label>
                                                    <input type="text" name="bus_swift_code"
                                                        class="form-control @error('bus_swift_code') is-invalid @enderror"
                                                        value="{{ old('bus_swift_code') }}"
                                                        placeholder="Enter your Swift Code">
                                                    @error('bus_swift_code')
                                                        <div class="invalid-feedback">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Config Settings -->
                                        <div class="tab-pane fade" id="v-reviews-tab-pane" role="tabpanel">
                                            <div class="row g-3">
                                                <div class="col-md-6">
                                                    <label class="form-label required">FBR Business Scenarios</label>
                                                    <select name="scenario_ids[]" id="scenario_ids"
                                                        class="form-select @error('scenario_ids') is-invalid @enderror"
                                                        multiple required>
                                                        @foreach ($scenarios as $scenario)
                                                            <option value="{{ $scenario->scenario_id }}"
                                                                @if (!empty($selectedScenarios) && in_array($scenario->scenario_id, $selectedScenarios)) selected @endif>
                                                                {{ $scenario->scenario_code }} -
                                                                {{ $scenario->scenario_name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                    <div class="invalid-feedback">
                                                        @error('scenario_ids')
                                                            {{ $message }}
                                                        @else
                                                            Please select at least one scenario.
                                                        @enderror
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="form-label required">FBR Environment</label>
                                                    <select name="fbr_env"
                                                        class="form-select @error('fbr_env') is-invalid @enderror"
                                                        required>
                                                        <option value="">-- Select Environment --</option>
                                                        <option value="sandbox"
                                                            {{ old('fbr_env') == 'sandbox' ? 'selected' : '' }}>
                                                            Sandbox</option>
                                                        <option value="production"
                                                            {{ old('fbr_env') == 'production' ? 'selected' : '' }}>
                                                            Production</option>
                                                    </select>
                                                    <div class="invalid-feedback">
                                                        @error('fbr_env')
                                                            {{ $message }}
                                                        @else
                                                            Please select FBR Environment.
                                                        @enderror
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="form-label required">FBR API Token (Sandbox)</label>
                                                    <textarea name="fbr_api_token_sandbox" class="form-control @error('fbr_api_token_sandbox') is-invalid @enderror"
                                                        placeholder="Enter Your FBR API Token (Sandbox)" required>{{ old('fbr_api_token_sandbox') }}</textarea>
                                                    <div class="invalid-feedback">
                                                        @error('fbr_api_token_sandbox')
                                                            {{ $message }}
                                                        @else
                                                            Please Enter Sandbox API Token.
                                                        @enderror
                                                    </div>
                                                </div>


                                                <div class="col-md-6">
                                                    <label class="form-label">FBR API Token (Production)</label>
                                                    <textarea name="fbr_api_token_prod" class="form-control @error('fbr_api_token_prod') is-invalid @enderror"
                                                        placeholder="Enter Your FBR API Token (Production)">{{ old('fbr_api_token_prod') }}</textarea>
                                                    <div class="invalid-feedback">
                                                        @error('fbr_api_token_prod')
                                                            {{ $message }}
                                                        @else
                                                            Please Enter Production API Token.
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- User Settings -->
                                        <div class="tab-pane fade" id="v-reviews-tab-pane1" role="tabpanel">
                                            <div class="row g-3">
                                                <div class="col-md-6">
                                                    <label class="form-label required">Name</label>
                                                    <input type="text" name="name"
                                                        class="form-control @error('name') is-invalid @enderror"
                                                        value="{{ old('name', $user->name ?? '') }}" required
                                                        placeholder="Enter Your Username">
                                                    <div class="invalid-feedback">
                                                        @error('name')
                                                            {{ $message }}
                                                        @else
                                                            Please Enter Name.
                                                        @enderror
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="form-label required">Email</label>
                                                    <input type="email" name="email"
                                                        class="form-control @error('email') is-invalid @enderror"
                                                        value="{{ old('email', $user->email ?? '') }}" required
                                                        placeholder="Enter Your Email">
                                                    <div class="invalid-feedback">
                                                        @error('email')
                                                            {{ $message }}
                                                        @else
                                                            Please Enter Email.
                                                        @enderror
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="form-label required">Password</label>
                                                    <input type="password" name="password"
                                                        class="form-control @error('password') is-invalid @enderror"
                                                        placeholder="Enter password " required>

                                                    <div class="invalid-feedback">
                                                        @error('password')
                                                            {{ $message }}
                                                        @else
                                                            Please Enter Password.
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Submit Button -->
                                            <div class="mt-4 text-end">
                                                <button type="submit" class="btn btn-primary">Save Configuration</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const typeSelect = document.getElementById('id_type');
            const input = document.getElementById('bus_ntn_cnic');
            if (!typeSelect || !input) return;

            function applyValidation() {
                const isNTN = typeSelect.value === 'NTN';

                // keep only digits as the user types
                input.value = input.value.replace(/\D/g, '');

                // switch constraints + UI hints
                input.maxLength = isNTN ? 7 : 13;
                input.setAttribute('pattern', isNTN ? '\\d{7}' : '\\d{13}');
                input.title = isNTN ?
                    'NTN must be exactly 7 digits' :
                    'CNIC must be exactly 13 digits (without dashes)';
                input.placeholder = isNTN ? 'Enter 7-digit NTN' : 'Enter 13-digit CNIC';
            }

            // Default to NTN on a fresh load if nothing selected
            if (!typeSelect.value) typeSelect.value = 'NTN';

            typeSelect.addEventListener('change', function() {
                input.value = ""; // clear value on type change
                applyValidation();
            });

            input.addEventListener('input', applyValidation);
            applyValidation();
        });
    </script>
    <script>
        $(document).ready(function() {
            $('#scenario_ids').select2({
                placeholder: "Select Scenarios",
                allowClear: true
            });
        });
    </script>

    {{-- <script>
        document.addEventListener("DOMContentLoaded", function() {
            // make sure form exists
            const form = document.querySelector('.app-form');
            if (!form) return;

            form.addEventListener('submit', function(e) {
                // remove previous validation markers
                form.querySelectorAll('.is-invalid').forEach(el => el.classList.remove('is-invalid'));

                // gather controls to validate (ignore disabled & hidden inputs)
                const controls = Array.from(form.querySelectorAll('input, select, textarea')).filter(el => {
                    return el.name && !el.disabled && el.type !== 'hidden';
                });

                // find first invalid control using HTML5 constraint validation API
                let firstInvalid = null;
                for (const el of controls) {
                    // use el.checkValidity() so we validate even if the element is hidden in a tab
                    if (!el.checkValidity()) {
                        firstInvalid = el;
                        // add bootstrap invalid class so styling shows
                        el.classList.add('is-invalid');
                        break;
                    }
                }

                if (firstInvalid) {
                    // prevent submission
                    e.preventDefault();
                    e.stopPropagation();

                    // locate the tab-pane that contains the invalid element
                    const tabPane = firstInvalid.closest('.tab-pane');
                    if (tabPane && tabPane.id) {
                        // find the button/link that opens this tab (data-bs-target or data-target)
                        const tabBtn = document.querySelector(
                            `[data-bs-target="#${tabPane.id}"], [data-target="#${tabPane.id}"]`);

                        if (tabBtn) {
                            // prefer the Bootstrap Tab API if available
                            if (typeof bootstrap !== 'undefined' && typeof bootstrap.Tab === 'function') {
                                try {
                                    const tabInstance = new bootstrap.Tab(tabBtn);
                                    tabInstance.show();
                                } catch (err) {
                                    // fallback to click
                                    tabBtn.click();
                                }
                            } else {
                                tabBtn.click();
                            }
                        }
                    }

                    // after tab is opened, focus and show native browser message
                    setTimeout(() => {
                        firstInvalid.focus();
                        if (typeof firstInvalid.reportValidity === 'function') {
                            firstInvalid.reportValidity(); // shows popup message in many browsers
                        }
                    }, 200);

                    // add bootstrap validation styling
                    form.classList.add('was-validated');
                    return false;
                }

                // if no invalid controls, let the form submit normally
            }, false);
        });
    </script> --}}



@endsection
