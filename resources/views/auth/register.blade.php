@extends('layouts.login')
@section('content')
@if (session('toast_error'))
    <script>
        toastr.error("{{ session('toast_error') }}", "Error", {
            closeButton: true,
            progressBar: true
        });
    </script>
@endif
<div class="container-fluid">
          <div class="row">
            <div class="col-lg-7 col-xl-8 d-none d-lg-block p-0">
              <div class="image-contentbox">
                <img src="assets/images/login/05.png" class="img-fluid" alt="">
              </div>
            </div>
            <div class="col-lg-5 col-xl-4 p-0 bg-white">
              <div class="form-container">
                <form class="app-form needs-validation" novalidate method="POST" action="{{ route('register') }}">
                @csrf
                  <div class="row">
                    <div class="col-12">
                      <div class="mb-5 text-center text-lg-start">
                        <div class="d-flex justify-content-center align-items-center my-2">
                        <img src="assets/images/logo/secureism_logo.svg" style="margin: bottom 2px;width:65%;" alt="#" class="dark-logo">
                        </div>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input class="form-control" required type="name" placeholder="Enter Your Name" name="name" autofocus autocomplete="name" />
                        <div class="invalid-feedback">
                            Please enter your Name.
                          </div>
                          @error('name')
                            <div class="text-danger">{{ $message }}</div>
                        @enderror
                         
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="mb-3">
                        <label for="username" class="form-label">Email</label>
                        <input class="form-control" required type="email" placeholder="Enter Your Email" name="email" value="{{old('email')}}" autofocus autocomplete="email" />
                        <div class="invalid-feedback">
                            Please enter your email.
                        </div>
                        @error('email')
                            <div class="text-danger">{{ $message }}</div>
                        @enderror
                      
                      </div>
                    </div>
                        <div class="col-12 mt-2">
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" name="password" required class="form-control" placeholder="Enter Your Password" id="password">
                                <div class="invalid-feedback">
                                    Please enter your password.
                                </div>
                                @error('password')
                                    <div class="text-danger">{{ $message }}</div>
                                @enderror
                                
                            </div>
                        </div>
                        <div class="col-12 mt-2">
                            <div class="mb-3">
                                <label for="password" class="form-label">Confirm Password</label>
                                <input type="password" name="password_confirmation" required class="form-control" placeholder="Enter Your Confirm Password" id="password">
                                <div class="invalid-feedback">
                                    Please enter your Confirm Password.
                                </div>
                                @error('password_confirmation')
                                    <div class="text-danger">{{ $message }}</div>
                                @enderror
                              
                            </div>
                        </div>
                    </div>
                    <div class="col-12 mt-2">
                        <div class="mb-3">
                            <div class="text-center mb-3">
                                <span>Already have an account?</span>
                                <a href="{{ route('login') }}" class="text-primary text-decoration-none fw-semibold ms-1">Login here</a>
                            </div>
                            <button type="submit" role="button" class="btn btn-primary w-100">Register</button>
                        </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
@endsection
