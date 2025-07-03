@extends('layouts.admin')

@section('content')
<style>
  table td,
  table th {
    white-space: nowrap;
  }
</style>
<div class="container-fluid">
            <!-- Breadcrumb start  -->
            
            <!-- Breadcrumb end -->
            
            <!-- List Js Table start -->
            <div class="row">
              <!-- List Js Table start -->
              <div class="col-xxl-12">
                <div class="card">
                  <div class="card-header">
                    <h5>Invoice Details</h5>
                  </div>
                  <div class="card-body p-0">
                    <form action="{{ route('xero.post_to_fbr') }}" method="POST">
                      @csrf
                    <div id="myTable">
                     
                      <div class="list-table-header d-flex justify-content-sm-between">
                        <!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                          data-bs-target="#exampleModal">Add</button> -->
                          <!-- <a href="{{ route('xero.connect') }}" class="btn btn-outline-primary">🔄 Reconnect Xero</a> -->
                          {{-- <a href="{{ route('xero.disconnect') }}" class="btn btn-danger">🔌 Disconnect Xero</a> --}}
                          {{-- <a href="{{ route('xero.invoices') }}" class="btn btn-outline-success">🔃 Sync Latest Invoices</a> --}}
                      
                          <button type="submit" class="btn btn-secondary">📤 Post Selected to FBR</button>

                          <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                            aria-hidden="true">
                            {{-- <form id="add_employee_form">
                              <div class="modal-dialog">
                                <div class="modal-content">
                                  <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Add Employee
                                    </h1>
                                    <button type="button" class="btn-close m-0" data-bs-dismiss="modal"
                                      aria-label="Close"></button>
                                  </div>
                                  <div class="modal-body">
                                    <div class="employee mb-3">
                                      <input type="hidden" id="id-field">
                                      <label class="form-label">Employee :</label>
                                      <input class="form-control" type="text" id="employee-field" placeholder="employee"
                                        required>
                                    </div>

                                    <div class="email mb-3">
                                      <label class="form-label">Email :</label>
                                      <input class="form-control" type="email" id="email-field" placeholder="email"
                                        required>
                                    </div>

                                    <div class="contact mb-3">
                                      <label class="form-label">contact :</label>
                                      <input class="form-control" type="text" id="contact-field" placeholder="contact"
                                        required>
                                    </div>

                                    <div class="date mb-3">
                                      <label class="form-label">date :</label>
                                      <input class="form-control" type="date" id="date-field" required>
                                    </div>

                                    <div class="status mb-3">
                                      <label class="form-label">status :</label>
                                      <select class="form-select" id="status-field" aria-label="Default select example">
                                        <option value="success">Status</option>
                                        <option value="success">Active</option>
                                        <option value="danger">Block</option>
                                      </select>
                                    </div>
                                  </div>
                                  <div class="modal-footer add">
                                    <input type="button" class="btn btn-secondary" data-bs-dismiss="modal" value="Close">
                                    <input type="submit" class="btn btn-primary" id="add-btn" value="Add">
                                    <button class="btn btn-success" data-bs-dismiss="modal"  id="edit-btn">Edit</button>
                                  </div>
                                </div>
                              </div>
                            </form> --}}
                          </div>
                          <form class="app-form app-icon-form" action="#">
                            <div class="position-relative ">
                              <input type="search" class="form-control search" placeholder="Search..."
                                aria-label="Search">
                              <i class="ti ti-search text-dark"></i>
                            </div>
                          </form>
                        </div>

                        <div class="app-scroll overflow-auto" style="max-width: 100%; overflow-x: auto;">
                          <table id="projectTableT" class="table table-bottom-border  list-table-data align-middle mb-0">
                            <thead>
                              <tr class="app-sort">
                                <th>
                                <input class="form-check-input" type="checkbox" id="checkAll">
                                </th>
                                <th></th>
                                <th>Invoice Number</th>
                                <th>Type</th>
                                <th>Reference</th>
                                <th>Status</th>
                                <th>Currency</th>
                                <th>Total</th>
                                <th>Sub Total</th>
                                <th>Total Tax</th>
                                <th>Amount Due</th>
                                <th>Amount Paid</th>
                                <th>Amount Credited</th>
                                <th>Is Discounted</th>
                                <th>Has Attachments</th>
                                <th>Date</th>
                                <th>Due Date</th>
                                <th>Updated At (UTC)</th>
                                <th>Branding Theme ID</th>
                                <th>Line Amount Types</th>
                                <th>Currency Rate</th>
                                <th>Repeating Invoice ID</th>
                                <th>Fully Paid On</th>
                                <th>Posted to FBR</th>
                                <th>FBR Invoice No</th>
                                <th>Tenant ID</th>
                                <th>Tenant Name</th>
                                <th>Tenant Type</th>
                                <th>Tenant Created</th>
                                <th>Tenant Updated</th>
                                <th>Organisation ID</th>
                                <th>View Items</th>
                              </tr>
                            </thead>
                            <tbody class="list" id="t-data">
                              @foreach ($invoices as $invoice)
                              <tr>
                                <th scope="row">
                                @if (!$invoice->posted_to_fbr)
                                 <input  type="checkbox" name="selected_invoices[]" value="{{ $invoice->id }}">
                                 @endif
                                </th>
                                <td class="employee"></td>
                                <td class="email">{{ $invoice->invoice_number }}</td>
                                <td class="contact">{{ $invoice->type }}</td>
                                <td class="date">{{ $invoice->reference }}</td>
                                <td class="status">
                                  @php
                                    $status = strtoupper($invoice->status); // Normalize status to uppercase
                                      @endphp

                                      @if ($status === 'PAID')
                                          <span class="badge bg-success-subtle text-success text-uppercase">Paid</span>
                                      @elseif ($status === 'AUTHORISED')
                                          <span class="badge text-light-info text-uppercase">Authorised</span>
                                      @elseif ($status === 'DRAFT')
                                          <span class="badge text-light-warning text-uppercase">Draft</span>
                                      @else
                                          <span class="badge bg-secondary-subtle text-secondary text-uppercase">{{ $status }}</span>
                                      @endif
                                </td>
                                <td class="date">{{ $invoice->currency_code }}</td>
                                <td class="date">{{ number_format($invoice->total, 2) }}</td>
                                <td class="date">{{ number_format($invoice->sub_total, 2) }}</td>
                                <td class="date">{{ number_format($invoice->total_tax, 2) }}</td>
                                <td class="date">{{ number_format($invoice->amount_due, 2) }}</td>
                                <td class="date">{{ number_format($invoice->amount_paid, 2) }}</td>
                                <td class="date">{{ number_format($invoice->amount_credited, 2) }}</td>
                                <td class="date">{{ $invoice->is_discounted ? 'Yes' : 'No' }}</td>
                                <td class="date">{{ $invoice->has_attachments ? 'Yes' : 'No' }}</td>
                                <td class="date">{{ optional($invoice->date)->format('d-m-Y H:i') ?? '-' }}</td>
                                <td class="date">{{ optional($invoice->due_date)->format('d-m-Y H:i') ?? '-' }}</td>
                                <td class="date">{{ optional($invoice->updated_date_utc)->format('Y-m-d H:i') ?? '-' }}</td>
                                <td class="date">{{ $invoice->branding_theme_id ?? '-' }}</td>
                                <td class="date">{{ $invoice->line_amount_types ?? '-' }}</td>
                                <td class="date">{{ $invoice->currency_rate ?? '-' }}</td>
                                <td class="date">{{ $invoice->repeating_invoice_id ?? '-' }}</td>
                                <td class="date">{{ optional($invoice->fully_paid_on_date)->format('Y-m-d H:i') ?? '-' }}</td>
                                <td class="date">{!! $invoice->posted_to_fbr ? '✅' : '❌' !!}</td>
                                <td class="date">{{ $invoice->fbr_invoice_number ?? '-' }}</td>
                                <td class="date">{{ $invoice->tenant_id ?? '-' }}</td>
                                <td class="date">{{ $invoice->tenant_name ?? '-' }}</td>
                                <td class="date">{{ $invoice->tenant_type ?? '-' }}</td>
                                <td class="date">{{ optional($invoice->tenant_created_at)->format('Y-m-d H:i') ?? '-' }}</td>
                                <td class="date">{{ optional($invoice->tenant_updated_at)->format('Y-m-d H:i') ?? '-' }}</td>
                                <td class="date">{{ $invoice->organisation_id ?? '-' }}</td>
                                <td>
                                <a href="{{ route('invoice.print', ['id' => $invoice->id]) }}" class="btn btn-sm btn-secondary" target="_blank" title="Print Invoice">
                                    <i class="fa-solid fa-print fa-fw"></i>
                                </a>
                                  <button type="button" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#itemsModal{{ $invoice->id }}">
                                    View
                                </button>
                                </td>
                              </tr>
                              @endforeach
                          
                            </tbody>
                          </table>
                        </div>
                    
                        <!-- Modal -->
                        @foreach ($invoices as $invoice)
                          <div class="modal fade" id="itemsModal{{ $invoice->id }}" tabindex="-1" aria-labelledby="itemsModalLabel{{ $invoice->id }}" aria-hidden="true">
                              <div class="modal-dialog modal-lg modal-dialog-scrollable">
                                  <div class="modal-content">
                                      <div class="modal-header">
                                          <h5 class="modal-title">Items for Invoice #{{ $invoice->invoice_number }}</h5>
                                          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                      </div>
                                      <div class="modal-body">
                                          @if($invoice->items->count())
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
                                                  @foreach ($invoice->items as $item)
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
                        <!-- End Modal -->
                      
                      <div class="list-pagination">
                        <ul class="pagination"></ul>
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

          <script>
            document.addEventListener('DOMContentLoaded', function () {
            
                function initInvoiceCheckboxListeners() {
                    const checkAll = document.getElementById('checkAll');
                    const checkboxes = document.querySelectorAll('input[name="selected_invoices[]"]');
            
                    // Check All behavior
                    if (checkAll) {
                        checkAll.addEventListener('change', function () {
                            checkboxes.forEach(cb => cb.checked = this.checked);
                            logSelectedInvoiceIds();
                        });
                    }
            
                    // Individual checkbox change
                    checkboxes.forEach(function (checkbox) {
                        checkbox.addEventListener('change', function () {
                            logSelectedInvoiceIds();
            
                            // Optional: update "Check All" state based on individual selections
                            if (checkAll) {
                                checkAll.checked = [...checkboxes].every(cb => cb.checked);
                            }
                        });
                    });
                }
            
                function logSelectedInvoiceIds() {
                    const checked = document.querySelectorAll('input[name="selected_invoices[]"]:checked');
                    const selectedIds = Array.from(checked).map(cb => cb.value);
                    console.log("Selected Invoice IDs:", selectedIds);
                }
            
                // Run initial bind
                initInvoiceCheckboxListeners();
            
                // Optional: Re-bind on AJAX/Pagination (e.g. if using Livewire or you load content dynamically)
                // If using a paginator or Livewire: hook into event/callback to rerun `initInvoiceCheckboxListeners()`
            
            });
            </script>
            
  
  

@endsection