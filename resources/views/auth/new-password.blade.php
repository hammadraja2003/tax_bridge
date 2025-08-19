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
              <form class="app-form" method="POST" action="{{ route('password.email') }}">
                 @csrf
                <div class="row">
                <div class="col-12">
                    <div class="mb-5 text-center text-lg-start">
                    <h2 class="text-primary f-w-600">Reset Your Password</h2>
                    <p>Create a email and sign in</p>
                    </div>
                </div>
                  <div class="col-12">
                    <div class="mb-3">
                      <label>Email Address</label>
                      <input type="email" name="email" class="form-control" placeholder="Enter Email" required>
                        @error('email') 
                        <span class="text-danger">{{ $message }}
                        </span> 
                        @enderror
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="mb-3">
                       <button type="submit" class="btn btn-primary">Send Reset Link</button>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
@stack('scripts')
@endsection