@extends('layouts.login')
@section('content')
<style>
.required::after {
    content: " *";
    color: red;
}
@media (min-width: 1200px) {
  .card-body {
    min-height: 520px; /* adjust karein apne content ke hisaab se */
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
              <img src="assets/images/logo/secureism_logo.svg" style="margin: bottom 2px;width:20%;" alt="#" class="dark-logo">
          </div>
      </div>
    </div>
    <div class="container-fluid">
      <div class="col-12">
        <div class="card">
          <div class="card-header">
            <h5>Basic Configuration Form</h5>
          </div>
          <div class="card-body">
            <form action="{{ route('register') }}" method="POST" enctype="multipart/form-data" class="app-form">
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
                            <input type="text" name="bus_name" class="form-control"
                              value="{{ old('bus_name', $config->bus_name ?? '') }}" required placeholder="Enter Business Name">
                              <div class="invalid-feedback">
                                Please Enter Business Configuration.
                              </div>
                            @error('bus_name')
                              <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                          </div>

                          <!-- NTN / CNIC -->
                          <div class="col-md-4">
                            <label class="form-label required">Select NTN / CNIC</label>
                            <select name="id_type" id="id_type" class="form-select" required>
                              <option value="NTN" {{ (old('id_type') ?? (isset($config) && strlen($config->bus_ntn_cnic) == 7 ? 'NTN' : 'CNIC')) == 'NTN' ? 'selected' : '' }}>NTN</option>
                              <option value="CNIC" {{ (old('id_type') ?? (isset($config) && strlen($config->bus_ntn_cnic) == 13 ? 'CNIC' : 'NTN')) == 'CNIC' ? 'selected' : '' }}>CNIC</option>
                            </select>
                          </div>

                          <div class="col-md-4">
                            <label class="form-label required">NTN / CNIC</label>
                            <input type="text" name="bus_ntn_cnic" class="form-control"
                              value="{{ old('bus_ntn_cnic', $config->bus_ntn_cnic ?? '') }}" required placeholder="Enter your NTN / CNIC Number">
                            <div class="invalid-feedback">Please Enter Business NTN/CNIC.</div>
                            @error('bus_ntn_cnic')
                              <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                          </div>

                          <!-- Registration -->
                          <div class="col-md-4">
                            <label class="form-label required">Registration #</label>
                            <input type="text" name="bus_reg_num" class="form-control"
                              value="{{ old('bus_reg_num', $config->bus_reg_num ?? '') }}" required placeholder="Enter your Registration Number">
                            <div class="invalid-feedback">Please Enter Business Registration.</div>
                            @error('bus_reg_num')
                              <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                          </div>

                          <!-- Contact -->
                          <div class="col-md-4">
                            <label class="form-label required">Contact Number</label>
                            <input type="text" name="bus_contact_num" class="form-control"
                              value="{{ old('bus_contact_num', $config->bus_contact_num ?? '') }}" required placeholder="Enter Contact Number">
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
                              value="{{ old('bus_contact_person', $config->bus_contact_person ?? '') }}" required placeholder="Enter Contact Person"> 
                              <div class="invalid-feedback">
                                  Please Enter Contact Person.
                              </div>
                              @error('bus_contact_person')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                              @enderror
                          </div>
                          <!-- Province -->
                          <div class="col-md-4">
                            <label for="bus_province" class="form-label required">Province</label>
                            <select name="bus_province" class="form-select" required>
                              <option value="">-- Select Province --</option>
                              <option value="Punjab" {{ old('bus_province', $config->bus_province ?? '') == 'Punjab' ? 'selected' : '' }}>Punjab</option>
                              <option value="Sindh" {{ old('bus_province', $config->bus_province ?? '') == 'Sindh' ? 'selected' : '' }}>Sindh</option>
                              <option value="Khyber Pakhtunkhwa" {{ old('bus_province', $config->bus_province ?? '') == 'Khyber Pakhtunkhwa' ? 'selected' : '' }}>Khyber Pakhtunkhwa</option>
                              <option value="Balochistan" {{ old('bus_province', $config->bus_province ?? '') == 'Balochistan' ? 'selected' : '' }}>Balochistan</option>
                            </select>
                            <div class="invalid-feedback">Please select Province.</div>
                            @error('bus_province')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                          </div>

                          <!-- Logo -->
                          <div class="col-md-4">
                            <label class="form-label {{ empty($config->bus_logo) ? 'required' : '' }}">Company Logo</label>
                            <input type="file" name="bus_logo" class="form-control" {{ empty($config->bus_logo) ? 'required' : '' }}>
                            <div class="invalid-feedback">
                              Please Enter Company Logo.
                            </div>
                            @error('bus_logo')
                              <div class="invalid-feedback">
                                  {{ $message }}
                              </div>
                            @enderror
                            @if (!empty($config->bus_logo))
                              <img src="{{ asset('uploads/company/' . $config->bus_logo) }}" alt="Company Logo" style="max-width:150px;margin-top:10px;">
                            @endif
                          </div>

                          <!-- Address -->
                          <div class="col-md-12">
                            <label class="form-label required">Business Address</label>
                            <textarea name="bus_address" class="form-control" placeholder="Enter Business Address"rows="3" required>{{ old('bus_address', $config->bus_address ?? '') }}</textarea>
                            <div class="invalid-feedback">
                                Please Enter your Business Address.
                            </div>
                            @error('bus_address')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                          </div>
                        </div>
                      </div>

                      <!-- Bank Details -->
                      <div class="tab-pane fade" id="v-history-tab-pane" role="tabpanel">
                        <div class="row g-3">
                          <div class="col-md-4">
                            <label class="form-label">Branch Name</label>
                            <input type="text" name="bus_acc_branch_name" class="form-control"
                              value="{{ old('bus_acc_branch_name', $config->bus_acc_branch_name ?? '') }}" placeholder="Enter your Branch Name">
                          </div>

                          <div class="col-md-4">
                            <label class="form-label">Branch Code</label>
                            <input type="text" name="bus_acc_branch_code" class="form-control"
                              value="{{ old('bus_acc_branch_code', $config->bus_acc_branch_code ?? '') }}" placeholder="Enter your Branch Code">
                          </div>

                          <div class="col-md-4">
                            <label class="form-label">Account Title</label>
                            <input type="text" name="bus_account_title" class="form-control"
                              value="{{ old('bus_account_title', $config->bus_account_title ?? '') }}" placeholder="Enter your Account Title">
                          </div>

                          <div class="col-md-4">
                            <label class="form-label">Account Number</label>
                            <input type="text" name="bus_account_number" class="form-control"
                              value="{{ old('bus_account_number', $config->bus_account_number ?? '') }}" placeholder="Enter your Account Number">
                          </div>

                          <div class="col-md-4">
                            <label class="form-label">IBAN</label>
                            <input type="text" name="bus_IBAN" class="form-control"
                              value="{{ old('bus_IBAN', $config->bus_IBAN ?? '') }}" placeholder="Enter your IBAN">
                          </div>

                          <div class="col-md-4">
                            <label class="form-label">Swift Code</label>
                            <input type="text" name="bus_swift_code" class="form-control"
                              value="{{ old('bus_swift_code', $config->bus_swift_code ?? '') }}" placeholder="Enter your Swift Code"> 
                          </div>
                        </div>
                      </div>

                      <!-- Config Settings -->
                      <div class="tab-pane fade" id="v-reviews-tab-pane" role="tabpanel">
                        <div class="row g-3">
                          <!-- <div class="col-md-4">
                            <label class="form-label required">Database Host</label>
                            <input type="text" name="db_host" class="form-control"
                              value="{{ old('db_host', $config->db_host ?? '') }}" required>
                          </div> -->
                          <!-- <div class="col-md-4">
                            <label class="form-label required">Database Name</label>
                            <input type="text" name="db_name" class="form-control"
                              value="{{ old('db_name', $config->db_name ?? '') }}" required>
                          </div> -->
                          <!-- <div class="col-md-4">
                            <label class="form-label required">Database Username</label>
                            <input type="text" name="db_username" class="form-control"
                              value="{{ old('db_username', $config->db_username ?? '') }}" required>
                          </div>
                          <div class="col-md-4">
                            <label class="form-label required">Database Password</label>
                            <input type="password" name="db_password" class="form-control"
                              value="{{ old('db_password', $config->db_password ?? '') }}" required>
                          </div> -->
                          <div class="col-md-6">
                            <label class="form-label required">Scenarios</label>
                            <select name="scenario_ids[]" id="scenario_ids" class="form-select" multiple required>
                                @foreach ($scenarios as $scenario)
                                    <option value="{{ $scenario->scenario_id }}"
                                        @if (!empty($selectedScenarios) && in_array($scenario->scenario_id, $selectedScenarios)) selected @endif>
                                        {{ $scenario->scenario_code }} - {{ $scenario->scenario_name }}
                                    </option>
                                @endforeach
                            </select>
                          </div>
                          <div class="col-md-6">
                            <label class="form-label required">FBR Environment</label>
                            <select name="fbr_env" class="form-select" required>
                              <option value="">-- Select Environment --</option>
                              <option value="sandbox" {{ old('fbr_env', $config->fbr_env ?? '') == 'sandbox' ? 'selected' : '' }}>Sandbox</option>
                              <option value="production" {{ old('fbr_env', $config->fbr_env ?? '') == 'production' ? 'selected' : '' }}>Production</option>
                            </select>
                          </div>
                          <div class="col-md-4">
                            <label class="form-label required">FBR API Token (Sandbox)</label>
                            <textarea name="fbr_api_token_sandbox" class="form-control" placeholder="Enter Your FBR API Token (Production)">
                              {{ old('fbr_api_token_sandbox', $config->fbr_api_token_sandbox ?? '') }}</textarea>
                              <div class="invalid-feedback">
                                FBR API Token (Sandbox)
                            </div>
                            @error('fbr_api_token_sandbox')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                          </div>
                          <div class="col-md-4">
                            <label class="form-label">FBR API Token (Production)</label>
                            <textarea name="fbr_api_token_prod" class="form-control" placeholder="Enter Your FBR API Token (Production)">{{ old('fbr_api_token_prod', $config->fbr_api_token_prod ?? '') }}</textarea>
                          </div>
                        </div>
                      </div>

                      <!-- User Settings -->
                      <div class="tab-pane fade" id="v-reviews-tab-pane1" role="tabpanel">
                        <div class="row g-3">
                          <div class="col-md-6">
                            <label class="form-label required">Name</label>
                            <input type="text" name="name" class="form-control"
                              value="{{ old('name', $user->name ?? '') }}" required placeholder="Enter Your Username">
                              <div class="invalid-feedback">
                                Please Enter Name.
                            </div>
                              @error('name')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                          </div>
                          <div class="col-md-6">
                            <label class="form-label required">Email</label>
                            <input type="text" name="email" class="form-control"
                              value="{{ old('email', $user->email ?? '') }}" required placeholder="Enter Your Email">
                              <div class="invalid-feedback">
                                Please Enter Email.
                              </div>
                              @error('email')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                              @enderror
                          </div>
                          <div class="col-md-6">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control"
                              placeholder="Enter new password (optional)">
                          </div>
                        </div>

                        <!-- Submit Button only in User Settings -->
                        <div class="mt-4 text-center">
                          <button type="submit" class="btn btn-primary">Save Configuration</button>
                        </div>
                      </div>
                    </div>
                  </div><!-- /.col-xl-9 -->
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  @push('scripts')
        <script>
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
        <script>
            $(document).ready(function() {
                $('#scenario_ids').select2();
            });
        </script>
    @endpush
@endsection
