@extends('layouts.login')
@section('content')
 <div class="container-fluid">
        <div class="row">
          <div class="col-lg-7 col-xl-8 d-none d-lg-block p-0">
            <div class="image-contentbox">
              <img src="assets/images/login/03.png" class="img-fluid" alt="">
            </div>
          </div>
          <div class="col-lg-5 col-xl-4 p-0 bg-white">
            <div class="form-container">
              <form class="app-form" method="POST" action="{{ route('password.update') }}">
                  @csrf
                   @method('PUT') 
                    <input type="hidden" name="token" value="{{ $token }}">
                    <input type="hidden" name="email" value="{{ $email }}">
                <div class="row">
                  <div class="col-12">
                    <div class="mb-5 text-center text-lg-start">
                      <h2 class="text-primary f-w-600">Reset Your Password</h2>
                      <p>Create a new password and sign in to admin</p>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="mb-3">
                      <label for="password" class="form-label">New Password</label>
                      <input type="password" name="password" class="form-control" placeholder="Enter Your Password" id="password">
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="mb-3">
                      <label for="password" class="form-label">Confirm Password</label>
                      <input type="password" name="password_confirmation" class="form-control" placeholder="Enter Your Password" id="password1"
                        required="">
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary w-100">Reset Password</button>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
@endsection


