@extends('layouts.admin')
@section('content')
<div class="container">
  <h2 class="mb-4 text-center">Profile Update</h2>
  <form class="app-form needs-validation" id="updateProfileForm" novalidate method="POST" action="{{ route('update-profile',$user->id) }}" enctype="multipart/form-data">
    @csrf
    <div class="card mb-4">
      <div class="card-body">
        <div class="row mb-3">
          <div class="col-md-6">
            <label class="form-label required">UserName</label>
            <input type="text" name="name" required class="form-control @error('title', 'post') is-invalid @enderror" id="name" value="{{$user->name}}" />
            <input type="hidden" name="id" required class="form-control @error('title', 'post') is-invalid @enderror" id="id" value="{{$user->id}}" />
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
            <input type="text" name="email" required class="form-control @error('title', 'post') is-invalid @enderror" id="email" value="{{$user->email}}" readonly />
            <input type="hidden" name="old_email" id="old_email" value="{{$user->email}}">
            <input type="hidden" name="old_password" id="old_password" value="{{$user->password}}">
            <div class="invalid-feedback">Please Enter Email</div>
            @error('email') 
            <div class="invalid-feedback">
                {{ $message }}
            </div>
            @enderror
          </div>
        
        </div>
        <div class="row mb-3">
        <div class="col-md-6">
            <label class="form-label required">Password</label>
            <div class="input-group">
                <input type="password" name="password" class="form-control" id="password" placeholder="Enter new password" />
                <span class="input-group-text" id="togglePassword" style="cursor: pointer;"><i class="fa fa-eye"></i></span>
            </div>
            <div class="form-text">Min 8 characters, 1 uppercase, 1 lowercase, 1 number, 1 special character</div>
            @error('password') <div class="text-danger">{{ $message }}</div> @enderror
            </div>

            <!-- Confirm Password -->
            <div class="col-md-6">
            <label class="form-label required">Confirm Password</label>
            <div class="input-group">
            <input type="password" name="confirmed_password" class="form-control" id="confirmed_password" placeholder="Confirm password" />
                <span class="input-group-text" id="toggleConfirmPassword" style="cursor: pointer;"><i class="fa fa-eye"></i></span>
            </div>
            <div id="passwordMatchError" class="text-danger"></div>
            </div>
            <div class="text-end">
             <button type="submit" class="btn btn-primary">Update Profile</button>
            </div>
        </div>

        <!-- <div class="row mb-3">
          <div class="col-md-6">
              <label class="form-label {{ empty($user->profile_photo_path) ? 'required' : '' }}">User Profile Image</label>
              <input type="file" name="profile_photo_path" class="form-control" {{ empty($user->profile_photo_path) ? 'required' : '' }}>
      
              @if(!empty($user->profile_photo_path))
              <div class="mt-3">
                  <img src="{{ asset('uploads/user_images/' . $user->profile_photo_path) }}"
                       alt="Company Logo"
                       style="max-width: 200px; height: auto; border: 1px solid #ddd; padding: 5px; border-radius: 8px; box-shadow: 0 2px 6px rgba(0,0,0,0.1);">
              </div>
              @endif
              <div class="invalid-feedback">
                  Please Enter Profile Image.
              </div>
              @error('profile_photo_path') 
              <div class="invalid-feedback">
                  {{ $message }}
              </div> 
              @enderror
          </div>
      </div> -->
      
      
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
<script>
  // Toggle password visibility
  document.getElementById('togglePassword').addEventListener('click', function () {
    const passwordInput = document.getElementById('password');
    const icon = this.querySelector('i');
    if (passwordInput.type === 'password') {
      passwordInput.type = 'text';
      icon.classList.remove('fa-eye');
      icon.classList.add('fa-eye-slash');
    } else {
      passwordInput.type = 'password';
      icon.classList.remove('fa-eye-slash');
      icon.classList.add('fa-eye');
    }
  });

  // Toggle confirm password visibility
  document.getElementById('toggleConfirmPassword').addEventListener('click', function () {
    const confirmInput = document.getElementById('confirmed_password');
    const icon = this.querySelector('i');
    if (confirmInput.type === 'password') {
      confirmInput.type = 'text';
      icon.classList.remove('fa-eye');
      icon.classList.add('fa-eye-slash');
    } else {
      confirmInput.type = 'password';
      icon.classList.remove('fa-eye-slash');
      icon.classList.add('fa-eye');
    }
  });

  // Check password match on form submit
  document.getElementById('updateProfileForm').addEventListener('submit', function (e) {
    const password = document.getElementById('password').value;
    const confirm = document.getElementById('confirmed_password').value;
    const error = document.getElementById('passwordMatchError');

    if (password !== confirm) {
      e.preventDefault();
      error.textContent = 'Passwords do not match.';
    } else {
      error.textContent = '';
    }
  });
</script>
@endsection
