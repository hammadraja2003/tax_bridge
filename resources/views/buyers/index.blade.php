@extends('layouts.admin')
@section('content')
<style>
            table th, table td {
                white-space: nowrap;
                padding: 0.4rem 0.6rem;
                vertical-align: middle;
                font-size: 13px;
                text-align: center;
            }
            .app-scroll {
                    overflow-x: auto;
                    scrollbar-width: thin;
                    scrollbar-color: #c1c1c1 #f1f1f1;
                }

                .app-scroll::-webkit-scrollbar {
                    height: 8px;
                }

                .app-scroll::-webkit-scrollbar-thumb {
                    background-color: #c1c1c1;
                    border-radius: 6px;
                }
       
            .btn-outline-success:hover .text-success {
                color: #fff !important;
            } 
            #projectTableT th:nth-child(1),
            #projectTableT td:nth-child(1) {
                width: 80px; /* HS Code */
            }
            #projectTableT th:nth-child(2),
            #projectTableT td:nth-child(2) {
                width: 80px; /* HS Code */
            }

            #projectTableT th:nth-child(3),
            #projectTableT td:nth-child(3) {
                width: 70px; /* Price */
            }

            #projectTableT th:nth-child(4),
            #projectTableT td:nth-child(4) {
                width: 90px; /* Tax Rate */
            }

            #projectTableT th:nth-child(5),
            #projectTableT td:nth-child(5) {
                width: 80px; /* UOM */
            }
            #projectTableT th:nth-child(6),
            #projectTableT td:nth-child(6) {
                width: 70px; /* contact */
            }
            #projectTableT th:nth-child(7),
            #projectTableT td:nth-child(7) {
                width: 140px; /* IBAN */
            }
            #projectTableT th:nth-child(8),
            #projectTableT td:nth-child(8) {
                width: 110px; /* UOM */
            }
            #projectTableT th:nth-child(9),
            #projectTableT td:nth-child(9) {
                width: 300px; /* address */
                text-align: left;
                white-space: normal;
                word-break: break-word;
            }
            #projectTableT th:nth-child(10),
            #projectTableT td:nth-child(10) {
                width: 100px; /* Actions*/
            }
            @media (max-width: 991.98px) {
                .list-table-header {
                        flex-direction: column;
                        align-items: flex-start;
                        gap: 10px;
                    }

                    .search {
                        width: 100%;
                    }

                    #projectTableT th, #projectTableT td {
                        font-size: 11px;
                        padding: 0.3rem 0.4rem;
                    }

                    .card-header h5 {
                        font-size: 16px;
                    }

                    .btn {
                        font-size: 12px;
                        padding: 6px 10px;
                    }
                }

                @media (max-width: 576px) {
                    .modal-content {
                        font-size: 13px;
                    }

                    table {
                        font-size: 11px;
                    }

                    #projectTableT th:nth-child(n),
                    #projectTableT td:nth-child(n) {
                        width: auto !important;
                    }

                    .table-responsive {
                        overflow-x: auto;
                    }

                    .app-scroll {
                        -webkit-overflow-scrolling: touch;
                    }
                }
                @media (max-width: 999px) {
                    table {
                        min-width: 1700px;
                    }
                }  
           
</style>
<div class="container" style="max-width: 1873px;">
   <div class="container-fluid">
            <!-- List Js Table start -->
            <div class="row table_setting">
              <!-- List Js Table start -->
              <div class="col-xxl-12">
                <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Client Details</h5>
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
                        <table id="projectTableT" class="table table-striped table-bordered">
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
                                    <th style="min-width: 280px;">Address</th>
                                    <th style="min-width: 20px;">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="list" id="t-data">
                                @forelse($buyers as $buyer)
                                    <tr>
                                        <td>
                                            @if($buyer->byr_logo)
                                                <img src="{{ asset('uploads/buyer_images/' . $buyer->byr_logo) }}" alt="Logo" width="50" style="max-width: 200px;">
                                                
                                            @else
                                                N/A
                                            @endif
                                        </td>
                                        <td class="employee">{{ $buyer->byr_name }}</td>
                                        <td class="email">
                                            @if($buyer->byr_type == 1)
                                                <span class="badge text-bg-success">Registered</span>
                                            @else
                                                <span class="badge text-bg-secondary">Unregistered</span>
                                            @endif
                                        </td>
                                        <td class="email">{{ $buyer->byr_ntn_cnic }}</td>
                                        <td class="contact">{{ $buyer->byr_contact_person }}</td>
                                        <td class="date">{{ $buyer->byr_contact_num }}</td>
                                        <td>{{ $buyer->byr_IBAN }}</td>
                                        <td>{{ $buyer->byr_account_number }}</td>
                                        <td style="white-space: normal; max-width: 200px;">{{ $buyer->byr_address }}</td>
                                        <td>
                                            <a href="{{ route('buyers.edit', Crypt::encryptString($buyer->byr_id)) }}" class="btn btn-xs btn-outline-success"><i class="ti ti-edit f-s-20 text-success"></i></a>
                                            <form action="{{ route('buyers.delete', $buyer->byr_id) }}" method="POST" style="display:inline;">
                                                @csrf
                                                @method('DELETE')
                                                <button type="button" class="btn btn-outline-danger btn-xs delete-button">
                                                    <i class="ti ti-trash f-s-20"></i>
                                                </button>
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
                        <div class="d-flex justify-content-between align-items-center px-3 py-2 small text-muted">
                            <div id="table-count-info">
                                Showing 0 to 0 of 0 entries
                            </div>
                            <div class="list-pagination">
                                <ul class="pagination mb-2"></ul>
                            </div>
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
<script>
document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('.delete-button').forEach(button => {
        button.addEventListener('click', function (e) {
            const form = this.closest('form');
            Swal.fire({
                title: 'Are you sure?',
                text: "This action cannot be undone!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#e3342f',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Yes, delete it!',
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {
                    form.submit();
                }
            });
        });
    });
});
function updateTableCount(currentPage, itemsPerPage, totalItems) {
        let start = (currentPage - 1) * itemsPerPage + 1;
        let end = Math.min(currentPage * itemsPerPage, totalItems);

        if (totalItems === 0) {
            document.getElementById('table-count-info').innerText = 'Showing 0 to 0 of 0 entries';
        } else {
            document.getElementById('table-count-info').innerText =
                `Showing ${start} to ${end} of ${totalItems} entries`;
        }
    }

    document.addEventListener('DOMContentLoaded', function () {
        let currentPage = {{ $buyers->currentPage() }};
        let itemsPerPage = {{ $buyers->perPage() }};
        let totalItems = {{ $buyers->total() }};

        updateTableCount(currentPage, itemsPerPage, totalItems);
    });
</script>
@endsection
