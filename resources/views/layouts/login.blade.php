<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', 'Secureism | Invoicing Management System') }}</title>
    <link rel="icon" href="{{asset('assets/images/logo/favicon_sec.png')}}" type="image/x-icon">
    <link rel="shortcut icon" href="{{asset('assets/images/logo/favicon_sec.png.png')}}" type="image/x-icon">
    <!-- meta and title end-->
    <!-- css start-->
    <!-- Animation css -->
    <link rel="stylesheet" href="{{asset('assets/vendor/animation/animate.min.css')}}">
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
    <!-- apexcharts css -->
    <link rel="stylesheet" type="text/css" href="{{asset('assets/vendor/apexcharts/apexcharts.css')}}">
    <!-- slick css -->
    <link rel="stylesheet" href="{{asset('assets/vendor/slick/slick.css')}}">
    <link rel="stylesheet" href="{{asset('assets/vendor/slick/slick-theme.css')}}">
    <!-- glight css -->
    <link rel="stylesheet" href="{{asset('assets/vendor/glightbox/glightbox.min.css')}}">
    <!-- Data Table css -->
    <link rel="stylesheet" type="text/css" href="{{asset('assets/vendor/datatable/jquery.dataTables.min.css')}}">
    <!-- vector map css -->
    <link rel="stylesheet" href="{{asset('assets/vendor/vector-map/jquery-jvectormap.css')}}">
    <!-- Toatify css-->
    <link rel="stylesheet" href="{{asset('assets/vendor/notifications/toastify.min.css')}}">
    <link rel="preload" as="style" href="{{asset('build/assets/style-BVr_C8ru.css')}}" />
    <link rel="stylesheet" href="{{asset('build/assets/style-BVr_C8ru.css')}}" /><!-- css end-->
</head>

<body>
    @include('layouts.partials.errors')
    @yield('content')
</body>
<!--customizer-->
<div id="customizer"></div>
<div id="myChart"></div>
<!-- scripts start-->

<!-- latest jquery-->
<script src="{{asset('assets/js/jquery-3.6.3.min.js')}}"></script>
<!-- Bootstrap js-->
<script src="{{asset('assets/vendor/bootstrap/bootstrap.bundle.min.js')}}"></script>
<script src="{{asset('assets/js/formvalidation.js')}}"></script>
<!-- Simple bar js-->
<script src="{{asset('assets/vendor/simplebar/simplebar.js')}}"></script>
<!-- prism js-->
<script src="{{asset('assets/vendor/prism/prism.min.js')}}"></script>
<!-- App js-->
<script src="{{asset('assets/js/script.js')}}"></script>
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
<!-- apexcharts js-->
<script src="{{asset('assets/vendor/apexcharts/apexcharts.min.js')}}"></script>
<!-- Toatify js-->
<script src="{{asset('assets/vendor/notifications/toastify-js.js')}}"></script>
<!-- sweetalert js-->
<script src="{{asset('assets/vendor/sweetalert/sweetalert.js')}}"></script>
<!-- js -->
<script src="{{asset('assets/js/sweet_alert.js')}}"></script>
<!-- scripts end-->

</html>