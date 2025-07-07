@extends('layouts.admin')
@section('content')
<style>
        table {
            table-layout: auto;
            min-width: 1200px; /* Adjust as per column count and content */
        }
    table td,
        table th {
            white-space: nowrap;
            padding: 0.5rem 1rem;
            vertical-align: middle;
        }
        .app-scroll::-webkit-scrollbar {
                height: 10px; /* Controls the thickness of horizontal scrollbar */
            }
            .app-scroll::-webkit-scrollbar-track {
                background: #f1f1f1;
            }
            .app-scroll::-webkit-scrollbar-thumb {
                background-color: #c1c1c1;
                border-radius: 10px;
                border: 2px solid #f1f1f1;
            }
            /* Firefox support */
            .app-scroll {
                scrollbar-width: thin;
                scrollbar-color: #c1c1c1 #f1f1f1;
            }
            .table_setting {
                margin-right: calc(-6.5 * var(--bs-gutter-x));
                margin-left: calc(-6.5 * var(--bs-gutter-x));
            }
            .btn-outline-success:hover .text-success {
                color: #fff !important;
            } 
</style>
<div class="container">
   <div class="container-fluid">
            <!-- List Js Table start -->
            <div class="row table_setting">
              <!-- List Js Table start -->
              <div class="col-xxl-12">
                <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Buyers Details</h5>
                    <a href="{{ url()->previous() }}" class="btn btn-outline-dark"><i class="fa-solid fa-step-backward fa-fw me-1"></i>Back</a>
                </div>
                  <div class="card-body p-0">
                    <form action="" method="POST">
                      @csrf
                    <div id="myTable">
                      <div class="list-table-header d-flex justify-content-sm-between">
                          <a href="{{ route('buyer.create') }}" class="btn btn-outline-secondary"><i class="fa-solid fa-plus fa-fw"></i>Add</a>
                          <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                            aria-hidden="true">
                          </div>
                          <form class="app-form app-icon-form" action="#">
                            <div class="position-relative ">
                              <input type="search" class="form-control search" placeholder="Search..."
                                aria-label="Search">
                            </div>
                          </form>
                        </div>
                        <div class="app-scroll overflow-auto" style="max-width: 100%; overflow-x: auto; overflow-y: hidden;">
                        <table id="projectTableT" class="app-scroll table-responsive">
                            <thead>
                                <tr class="app-sort">
                                    <th style="min-width: 80px;">Logo</th>
                                    <th style="min-width: 120px;">Name</th>
                                    <th style="min-width: 100px;">Type</th>
                                    <th style="min-width: 130px;">NTN/CNIC</th>
                                    <th style="min-width: 150px;">Contact Person</th>
                                    <th style="min-width: 130px;">Contact #</th>
                                    <th style="min-width: 130px;">IBAN</th>
                                    <th style="min-width: 130px;">Account #</th>
                                    <th style="min-width: 200px;">Address</th>
                                    <th style="min-width: 100px;">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="list" id="t-data">
                                @forelse($buyers as $buyer)
                                    <tr>
                                        <td>
                                            @if($buyer->byr_logo)
                                                <img src="{{ asset('uploads/buyer_images/' . $buyer->byr_logo) }}" alt="Logo" width="50">
                                            @else
                                                N/A
                                            @endif
                                        </td>
                                        <td class="employee">{{ $buyer->byr_name }}</td>
                                        <td class="email">{{ $buyer->byr_type == 1 ? 'Registered' : 'Unregistered' }}</td>
                                        <td class="email">{{ $buyer->byr_ntn_cnic }}</td>
                                        <td class="contact">{{ $buyer->byr_contact_person }}</td>
                                        <td class="date">{{ $buyer->byr_contact_num }}</td>
                                        <td>{{ $buyer->byr_IBAN }}</td>
                                        <td>{{ $buyer->byr_account_number }}</td>
                                        <td style="white-space: normal; max-width: 200px;">{{ $buyer->byr_address }}</td>
                                        <td>
                                            <a href="{{ route('buyers.edit', $buyer->byr_id) }}" class="btn btn-sm btn-outline-success"><i class="ti ti-edit f-s-20 text-success"></i></a>
                                            <form action="" method="POST" style="display:inline;">
                                                @csrf
                                                @method('DELETE')
                                                <button class="btn btn-outline-danger" onclick="return confirm('Are you sure?')"><i class="ti ti-trash f-s-20"></i></button>
                                            </form>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="10" class="text-center">No buyers found.</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                        </div>
                    </div>
                  </form>
                  </div>
                </div>
              </div>
              <!-- Table with Pagination Table end -->
            </div>
            <!-- List Js Table end -->
    </div>
</div>
@endsection
