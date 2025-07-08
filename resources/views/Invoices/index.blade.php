@extends('layouts.admin')
@section('content')
<style>
        table {
                table-layout: fixed;
                width: 100%;
                min-width: 1000px;
            }

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
       
            .table_setting {
                margin-right: calc(-7.5 * var(--bs-gutter-x));
                margin-left: calc(-7.5 * var(--bs-gutter-x));
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
                width: 80px; /* Price */
            }

            #projectTableT th:nth-child(4),
            #projectTableT td:nth-child(4) {
                width: 80px; /* Tax Rate */
            }

            #projectTableT th:nth-child(5),
            #projectTableT td:nth-child(5) {
                width: 80px; /* UOM */
            }
            #projectTableT th:nth-child(6),
            #projectTableT td:nth-child(6) {
                width: 80px; /*  */
            }
            #projectTableT th:nth-child(7),
            #projectTableT td:nth-child(7) {
                width: 100px; /* Actions*/
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
                    <h5 class="mb-0">Invoice Details</h5>
                    <a href="{{ url()->previous() }}" class="btn btn-outline-dark"><i class="fa-solid fa-step-backward fa-fw me-1"></i>Back</a>
                </div>
                  <div class="card-body p-0">
                    <form action="" method="POST">
                      @csrf
                    <div id="myTable">
                      <div class="list-table-header d-flex justify-content-sm-between">
                          <a href="{{ route('invoices.create') }}" class="btn btn-outline-secondary"><i class="fa-solid fa-plus fa-fw"></i>New Invoice</a>
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
                                    <th>Date</th>
                                    <th>Type</th>
                                    <th>Buyer</th>
                                    <th>Seller</th>
                                    <th>FBR #</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody class="list" id="t-data">
                                @forelse($invoices as $inv)
                                    <tr>
                                        <td>{{ \Carbon\Carbon::parse($inv->invoice_date)->format('d M Y') }}</td>
                                        <td class="employee">{{ $inv->invoice_type }}</td>
                                        <td class="email">{{ $inv->buyer->byr_name ?? '-' }}</td>
                                        <td class="email">{{ $inv->seller->bus_name ?? '-' }}</td>
                                        <td class="contact">{{ $inv->fbr_invoice_number ?? 'N/A' }}</td>
                                        <td class="date">{{ $inv->response_status ?? 'Pending' }}</td>
                                        <td>
                                        <button type="button"
                                                class="btn btn-sm btn-outline-primary"
                                                data-bs-toggle="modal"
                                                data-bs-target="#itemsModal{{ $inv->invoice_id }}"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="View Item">
                                                <i class="fa-solid fa-eye fa-fw"></i>
                                            </button>
                                        <a href="{{ route('xero.print', Crypt::encryptString($inv->invoice_id)) }}"
                                            class="btn btn-sm btn-outline-info"
                                            target="_blank"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Print Invoice">
                                            <i class="fa-solid fa-print fa-fw"></i>
                                        </a>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="10" class="text-center">No Invoice found.</td>
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

                        @foreach ($invoices as $invoice)
                            <div class="modal fade" id="itemsModal{{ $invoice->invoice_id }}" tabindex="-1" aria-labelledby="itemsModalLabel{{ $invoice->invoice_id }}" aria-hidden="true">
                                <div class="modal-dialog modal-lg modal-dialog-scrollable">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Items for Invoice #{{ $invoice->fbr_invoice_number }}</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                        </div>
                                        <div class="modal-body">
                                            @if($invoice->details->count())
                                                <table class="table table-sm table-bordered">
                                                    <thead class="table-secondary">
                                                    <tr>
                                                        <th>Description</th>
                                                        <th>Quantity</th>
                                                        <th>Unit Amount</th>
                                                        <th>Line Amount</th>
                                                        <th>Item Code</th>
                                                        <th>Tax Amount</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    @foreach ($invoice->details as $item)
                                                        <tr>
                                                            <td>{{ $item->description }}</td>
                                                            <td>{{ $item->quantity }}</td>
                                                            <td>{{ number_format($item->unit_amount, 2) }}</td>
                                                            <td>{{ number_format($item->line_amount, 2) }}</td>
                                                            <td>{{ $item->item_code }}</td>
                                                            <td>{{ number_format($item->tax_amount, 2) }}</td>
                                                        </tr>
                                                    @endforeach
                                                    </tbody>
                                                </table>
                                            @else
                                                <p>No items found for this invoice.</p>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endforeach

                        
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
    document.addEventListener("DOMContentLoaded", function () {
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        tooltipTriggerList.forEach(function (tooltipTriggerEl) {
        new bootstrap.Tooltip(tooltipTriggerEl);
        });
    });
</script>
@endsection
