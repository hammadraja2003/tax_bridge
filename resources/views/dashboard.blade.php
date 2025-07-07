@extends('layouts.admin')
@section('content')
    <div class="container-fluid">
        <div class="row project_dashboard">
            <!-- Cards -->
            <div class="col-md-6 col-lg-3">
            <div class="card project-cards">
                <div class="card-body d-flex justify-content-between">
                <div>
                    <h6>Total Projects<span class="badge text-success">3.1%</span></h6>
                    <div class="d-flex align-items-center gap-2 mt-2">
                    <h4 class=" text-success f-w-600 counting" data-count='499'></h4>
                    <p class="m-0 text-secondary">All Projects This Month</p>
                    </div>
                </div>
                <div class="project-card-icon project-success bg-light-success h-55 w-55 d-flex-center b-r-100">
                    <i class="ti ti-select f-s-30 mb-1"></i>
                </div>
                </div>
            </div>
            </div>
            <div class="col-md-6 col-lg-3">
            <div class="card project-cards">
                <div class="card-body d-flex justify-content-between">
                <div>
                    <h6>Running Project<span class="badge text-warning">0.20%</span></h6>
                    <div class="d-flex align-items-center gap-2 mt-2">
                    <h4 class=" text-warning f-w-600 counting" data-count='159'></h4>
                    <p class="m-0 text-secondary">Delayed This Month</p>
                    </div>
                </div>
                <div class="project-card-icon project-secondary bg-light-warning h-55 w-55 d-flex-center b-r-100">
                    <i class="ti ti-alarm-minus f-s-30 mb-1"></i>
                </div>
                </div>
            </div>
            </div>
            <div class="col-md-6 col-lg-3">
            <div class="card project-cards">
                <div class="card-body d-flex justify-content-between">
                <div>
                    <h6>Pending<span class="badge text-danger">2.10%</span></h6>
                    <div class="d-flex align-items-center gap-2 mt-2">
                    <h4 class=" text-danger f-w-600 counting" data-count='220'></h4>
                    <p class="m-0 text-secondary">Pending This Month</p>
                    </div>
                </div>
                <div class="project-card-icon project-danger bg-light-danger h-55 w-55 d-flex-center b-r-100">
                    <i class="ti ti-rotate-clockwise-2 f-s-30 mb-1"></i>
                </div>
                </div>
            </div>
            </div>
            <div class="col-md-6 col-lg-3">
            <div class="card project-cards">
                <div class="card-body d-flex justify-content-between">
                <div>
                    <h6 class="text-secondary">Finished Projects<span class="badge text-success">1.1%</span></h6>
                    <div class="d-flex align-items-center gap-2 mt-2">
                    <h4 class=" text-success f-w-600 counting inline" data-count='199'></h4>
                    <p class="m-0 text-secondary">Finished This Month</p>
                    </div>
                </div>
                <div class="project-card-icon project-primary bg-light-success h-60 w-60 d-flex-center b-r-100">
                    <i class="ti ti-browser-check f-s-36 mb-1"></i>
                </div>
                </div>
            </div>
            </div>
            <!-- Cards end -->
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <!-- Basic Column Chart start -->
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <h5> Basic Column Chart</h5>
                    </div>
                    <div class="card-body">
                        <div id="column1"></div>
                    </div>
                </div>
            </div>
            <!-- Basic Column Chart end -->
            <!--  Column Chart with Datalabels start -->
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <h5> Column Chart with Datalabels</h5>
                    </div>
                    <div class="card-body">
                        <div id="column2"></div>
                    </div>
                </div>
            </div>
            <!--  Column Chart with Datalabels end -->
            <!-- Stacked Column Chart start -->
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <h5>Stacked Column Chart</h5>
                    </div>
                    <div class="card-body">
                        <div id="column3"></div>
                    </div>
                </div>
            </div>
            <!-- Stacked Column Chart end -->
            <!-- 100% Stacked Column Chart start -->
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <h5> 100% Stacked Column Chart</h5>
                    </div>
                    <div class="card-body">
                        <div id="column4"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection