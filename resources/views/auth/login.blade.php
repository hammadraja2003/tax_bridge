@extends('layouts.login')
@section('content')

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-7 col-xl-8 d-none d-lg-block p-0">
                <div class="image-contentbox">
                    <img src="assets/images/login/01.png" class="img-fluid" alt="">
                </div>
            </div>
            <div class="col-lg-5 col-xl-4 p-0 bg-white">
                 @if ($errors->any())
                    <div class="alert alert-danger">
                        @foreach ($errors->all() as $error)
                            <div>{{ $error }}</div>
                        @endforeach
                    </div>
                    
                @endif
                <div class="form-container">
                    <form class="app-form needs-validation" novalidate method="POST" action="{{ route('login') }}">
                        @csrf
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-5 text-center text-lg-start">
                                    <div class="d-flex justify-content-center align-items-center my-2">
                                        <img src="assets/images/logo/secureism_logo.svg"
                                            style="margin: bottom 2px;width:65%;" alt="#" class="dark-logo">
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mb-3">
                                    <label for="username" class="form-label">Email</label>
                                    <input class="form-control" required type="email" placeholder="Enter Your Email"
                                        name="email" value="{{ old('email') }}" autofocus autocomplete="email" />
                                    <div class="invalid-feedback">
                                        Please enter your email.
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 mt-2">
                                <div class="mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <!-- <a href="{{ route('password.request') }}" class="link-primary float-end">Forgot Password?</a> -->
                                    <div class="input-group">
                                        <input type="password" name="password" required class="form-control"
                                            placeholder="Enter Your Password" id="password">
                                        <span class="input-group-text" id="togglePassword" style="cursor: pointer;">
                                            <i class="fa fa-eye"></i>
                                        </span>
                                    </div>
                                    <div class="invalid-feedback">
                                        Please enter your password.
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-12 mt-2">
                            <div class="mb-3">
                                <button type="submit" role="button" class="btn btn-primary w-100">Sign In</button>
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
