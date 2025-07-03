<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <!-- All meta and title start-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
      content="Multipurpose, super flexible, powerful, clean modern responsive bootstrap 5 admin template">
<meta name="keywords"
      content="admin template, ra-admin admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="la-themes">
<link rel="icon" href="{{asset('assets/images/logo/favicon.png')}}" type="image/x-icon">
<link rel="shortcut icon" href="{{asset('assets/images/logo/favicon.png')}}" type="image/x-icon">
<title>{{ config('app.name', 'Tax Bridge') }}</title>
<!-- meta and title end-->

    <!-- css start-->
<!-- Animation css -->
<link rel="stylesheet" href="{{asset('assets/vendor/animation/animate.min.css')}}" >

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com/">
  <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&amp;display=swap"
    rel="stylesheet">

<!-- Weather icon css-->
<link rel="stylesheet" type="text/css" href="{{asset('assets/vendor/weather/weather-icons.css')}}">
<link rel="stylesheet" type="text/css" href="{{asset('assets/vendor/weather/weather-icons-wind.css')}}">

  <!--font-awesome-css-->
  <link rel="stylesheet" href="{{asset('assets/vendor/fontawesome/css/all.css')}}">

<!--Flag Icon css-->
<link rel="stylesheet" type="text/css" href="{{asset('assets/vendor/flag-icons-master/flag-icon.css')}}">

<!-- Tabler icons-->
<link rel="stylesheet" type="text/css" href="{{asset('assets/vendor/tabler-icons/tabler-icons.css')}}">

<!-- Prism css-->
<link rel="stylesheet" type="text/css" href="{{asset('assets/vendor/prism/prism.min.css')}}">

<!-- Bootstrap css-->
<link rel="stylesheet" type="text/css" href="{{asset('assets/vendor/bootstrap/bootstrap.min.css')}}">

<!-- Simplebar css-->
<link rel="stylesheet" type="text/css" href="{{asset('assets/vendor/simplebar/simplebar.css')}}">
 <!-- Toatify css-->
 <link rel="stylesheet" href="{{asset('assets/vendor/notifications/toastify.min.css')}}">
 <!-- latest jquery-->
<script src="{{asset('assets/js/jquery-3.6.3.min.js')}}"></script>

    <!-- Data Table css-->
    <link rel="stylesheet" type="text/css" href="{{asset('assets/vendor/datatable/jquery.dataTables.min.css')}}">

<link rel="preload" as="style" href="{{asset('build/assets/style-BVr_C8ru.css')}}" />
<link rel="stylesheet" href="{{asset('build/assets/style-BVr_C8ru.css')}}" /><!-- css end-->

</head>
    <body>
    <div class="app-wrapper">
        <div class="loader-wrapper">
            <div class="app-loader">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>

        @include('layouts.partials.navbar')
        <div class="app-content">
            @include('layouts.partials.header')
            <main>
                @yield('content')
                @include('layouts.partials.errors')

            <!-- modal -->
                <div class="modal" tabindex="-1" id="welcomeCard" data-bs-backdrop="static">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content welcome-image">

                            <div class="modal-body">
                                <div>
                                    <div class="text-center">
                                        <div class="text-end">
                                            <i class="ti ti-x fs-5 text-secondary" data-bs-dismiss="modal"></i>
                                        </div>
                                        <h2 class="text-primary f-w-600">Welcome <i class="ti ti-heart-handshake text-warning"></i></h2>
                                        <p class="text-light f-w-500 f-s-16 mx-sm-5">
                                            Start Multipurpose, clean modern responsive bootstrap 5 admin template</p>
                                        <img src="assets/images/modals/welcome.png" class="img-fluid h-140 mt-3 mb-3" alt="">
                                        <div class="row">
                                            <div class="col-12 text-center">
                                                <div class="">
                                                    <div class="mb-2">
                                                        <p class="text-secondary f-w-400"><i
                                                                class="ti ti-bookmarks f-s-15 text-primary me-2"></i>Build
                                                            your next project faster with AdminX</p>
                                                    </div>

                                                    <div class="mb-2">
                                                        <p class="text-secondary f-w-400 ms-2 mb-0"><i
                                                                class="ti ti-presentation-analytics f-s-15 me-2 text-success"></i>Start
                                                            Your Project With
                                                            Flexible Admin</p>
                                                    </div>

                                                    <div class="mb-2">
                                                        <p class="text-secondary f-w-400 ms-2 mb-0"> <i
                                                                class="ti ti-users f-s-15 me-2 text-danger"></i>
                                                            Enjoy dev-friendly features </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mb-4 mt-2">
                                            <button type="button" class="btn btn-primary text-white w-200 btn-lg"
                                                data-bs-dismiss="modal">Let's
                                                Started <i class="ti ti-chevrons-right"></i> </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </main>
        </div>

        <div class="go-top">
            <span class="progress-value">
                <i class="ti ti-arrow-up"></i>
            </span>
        </div>

        @include('layouts.partials.footer')
        

    </div>

    </body>
    <!--customizer--> 
<div id="myChart"></div>
     
<!-- scripts start-->

  
<!-- Bootstrap js-->
<script src="{{asset('assets/vendor/bootstrap/bootstrap.bundle.min.js')}}"></script>

<script src="{{asset('assets/js/formvalidation.js')}}"></script>

<!-- Simple bar js-->
<script src="{{asset('assets/vendor/simplebar/simplebar.js')}}"></script>

<!-- Customizer js-->
<script src="{{asset('assets/js/customizer.js')}}"></script>

<!-- prism js-->
<script src="{{asset('assets/vendor/prism/prism.min.js')}}"></script>

<!-- App js-->
<script src="{{asset('assets/js/script.js')}}"></script>

    <!--customizer-->
    <div id="customizer"></div>

<!-- slick-file -->
<script src="{{asset('assets/vendor/slick/slick.min.js')}}"></script>

<!-- vector map plugin js -->
<script src="{{asset('assets/vendor/vector-map/jquery-jvectormap-2.0.5.min.js')}}"></script>
<script src="{{asset('assets/vendor/vector-map/jquery-jvectormap-world-mill.js')}}"></script>

<!--cleave js  -->
<script src="{{asset('assets/vendor/cleavejs/cleave.min.js')}}"></script>

<!-- Glight js -->
<script src="{{asset('assets/vendor/glightbox/glightbox.min.js')}}"></script>

<!-- data table-->
<script src="{{asset('assets/vendor/datatable/jquery.dataTables.min.js')}}"></script>

 
 
<script src="{{asset('assets/js/advance_table.js')}}"></script>
 

<!-- apexcharts js-->
<script src="{{asset('assets/vendor/apexcharts/apexcharts.min.js')}}"></script>

<!-- List js -->
<script src="{{asset('assets/vendor/listJs/list-jquery.min.js')}}"></script>
<script src="{{asset('assets/vendor/listJs/list.min.js')}}"></script>

<!-- list table js -->
<script src="{{asset('assets/js/list_js.js')}}"></script>

<!-- Toatify js-->
<script src="{{asset('assets/vendor/notifications/toastify-js.js')}}"></script>

<!-- sweetalert js-->
<script src="{{asset('assets/vendor/sweetalert/sweetalert.js')}}"></script>

<!-- js -->
<script src="{{asset('assets/js/sweet_alert.js')}}"></script>
<!-- scripts end-->

<script src="{{asset('assets/js/column.js')}}"></script>

<script src="{{asset('assets/vendor/apexcharts/column/dayjs.min.js')}}"></script>
<script src="{{asset('assets/vendor/apexcharts/column/quarterOfYear.min.js')}}"></script>


</html>