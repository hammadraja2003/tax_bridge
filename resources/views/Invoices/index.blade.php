@extends('layouts.admin')
@section('content')
<style>
    table th,
    table td {
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
        width: 80px;
        /* HS Code */
    }

    #projectTableT th:nth-child(2),
    #projectTableT td:nth-child(2) {
        width: 80px;
        /* HS Code */
    }

    #projectTableT th:nth-child(3),
    #projectTableT td:nth-child(3) {
        width: 80px;
        /* Price */
    }

    #projectTableT th:nth-child(4),
    #projectTableT td:nth-child(4) {
        width: 80px;
        /* Tax Rate */
    }

    #projectTableT th:nth-child(5),
    #projectTableT td:nth-child(5) {
        width: 80px;
        /* UOM */
    }

    #projectTableT th:nth-child(6),
    #projectTableT td:nth-child(6) {
        width: 90px;
        /*  */
    }

    #projectTableT th:nth-child(7),
    #projectTableT td:nth-child(7) {
        width: 80px;
        /*  */
    }

    #projectTableT th:nth-child(8),
    #projectTableT td:nth-child(8) {
        width: 80px;
        /*  */
    }

    #projectTableT th:nth-child(9),
    #projectTableT td:nth-child(9) {
        width: 80px;
        /*  */
    }

    #projectTableT th:nth-child(10),
    #projectTableT td:nth-child(10) {
        width: 90px;
        /*  */
    }

    #projectTableT th:nth-child(11),
    #projectTableT td:nth-child(11) {
        width: 80px;
        /*  */
    }

    #projectTableT th:nth-child(12),
    #projectTableT td:nth-child(12) {
        width: 80px;
        /*  */
    }

    #projectTableT th:nth-child(13),
    #projectTableT td:nth-child(13) {
        width: 100px;
        /* Actions*/
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

        #projectTableT th,
        #projectTableT td {
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

                <div class="mb-4 p-4 border rounded shadow-sm text-white" style="background-color: #1d9797;">
                    <form method="POST" action="{{ route('invoices.filter') }}" class="row g-2 align-items-end">
                        @csrf
                        {{-- Invoice Type Dropdown --}}
                        <div class="col-md-3">
                            <label for="invoice_type" class="form-label">Invoice Type</label>
                            <select name="invoice_type" id="invoice_type" class="form-select">
                                <option value="">All Types</option>
                                <option value="Sales Invoice" {{ request('invoice_type')=='Sales Invoice' ? 'selected'
                                    : '' }}>Sales Invoice</option>
                                <option value="Debit Note" {{ request('invoice_type')=='Debit Note' ? 'selected' : ''
                                    }}>Debit Note</option>
                                <!-- Add other types if needed -->
                            </select>
                        </div>
                        {{-- Invoice Status Dropdown --}}
                        <div class="col-md-3">
                            <label for="is_posted_to_fbr" class="form-label">Posted to FBR?</label>
                            <select name="is_posted_to_fbr" id="is_posted_to_fbr" class="form-select">
                                <option value="">All</option>
                                <option value="1" {{ request('is_posted_to_fbr')==='1' ? 'selected' : '' }}>Yes</option>
                                <option value="0" {{ request('is_posted_to_fbr')==='0' ? 'selected' : '' }}>No</option>
                            </select>
                        </div>

                        {{-- Date From --}}
                        <div class="col-md-3">
                            <label for="date_from" class="form-label">Date From</label>
                            <input type="date" name="date_from" id="date_from" class="form-control"
                                value="{{ request('date_from') }}">
                        </div>

                        {{-- Date To --}}
                        <div class="col-md-3">
                            <label for="date_to" class="form-label">Date To</label>
                            <input type="date" name="date_to" id="date_to" class="form-control"
                                value="{{ request('date_to') }}">
                        </div>
                        <div class="col-12 d-flex justify-content-end gap-2">
                            {{-- Filter Button --}}
                            <button type="submit" class="btn btn-primary">Filter</button>

                            {{-- Clear Filter Button (only if any filter is applied) --}}
                            @if(
                            request()->filled('invoice_type') ||
                            request()->filled('date_from') ||
                            request()->filled('date_to') ||
                            request()->filled('is_posted_to_fbr')
                            )
                            <a href="{{ route('invoices.index') }}" class="btn btn-secondary">Clear</a>
                            @endif
                        </div>
                    </form>
                </div>

                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Invoice Details</h5>
                        <a href="{{ url()->previous() }}" class="btn btn-outline-dark"><i
                                class="fa-solid fa-step-backward fa-fw me-1"></i>Back</a>
                    </div>

                    <div class="card-body p-0">
                        <div id="myTable">
                            <div class="list-table-header d-flex justify-content-sm-between">
                                <a href="{{ route('invoices.create') }}" class="btn btn-primary"><i
                                        class="fa-solid fa-plus fa-fw"></i>New Invoice</a>
                                <div class="modal fade" id="exampleModal" tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                </div>
                                <form class="app-form app-icon-form" action="#">
                                    <div class="position-relative ">
                                        <input type="search" class="form-control search" placeholder="Search..."
                                            aria-label="Search">
                                    </div>
                                </form>
                            </div>
                            <div class="app-scroll table-responsive">
                                <table id="projectTableT"
                                    class="table table-sm table-striped table-bordered text-nowrap">
                                    <thead>
                                        <tr class="app-sort">
                                            <th>Invoice Date</th>
                                            <th>Type</th>
                                            <th>Buyer</th>
                                            <th>Seller</th>
                                            <th>FBR #</th>
                                            <th>Posted to FBR</th>
                                            <th>Excl. Tax</th>
                                            <th>Incl. Tax</th>
                                            <th>Total Sales Tax</th>
                                            <th>Total Further Tax</th>
                                            <th>Total Extra Tax</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody class="list" id="t-data">
                                        @forelse($invoices as $inv)
                                        <tr>
                                            <td>{{ \Carbon\Carbon::parse($inv->invoice_date)->format('d M Y') }}</td>
                                            <td class="employee">{{ $inv->invoice_type }}</td>
                                            <td class="email" style="white-space: normal;max-width: 100px;">
                                                {{ $inv->buyer->byr_name ?? '-' }}</td>
                                            <td class="email" style="white-space: normal;max-width: 100px;">
                                                {{ $inv->seller->bus_name ?? '-' }}</td>
                                            <td class="contact">{{ $inv->fbr_invoice_number ?? 'N/A' }}</td>
                                            <td class="contact">
                                                @if ($inv->is_posted_to_fbr === 1)
                                                <span class="badge text-bg-success">Yes</span>
                                                @elseif ($inv->is_posted_to_fbr === 0)
                                                <span class="badge text-bg-danger">No</span>
                                                @else
                                                <span class="badge text-bg-secondary">N/A</span>
                                                @endif
                                            </td>
                                            <td>{{ number_format($inv->totalAmountExcludingTax, 2) }}</td>
                                            <td>{{ number_format($inv->totalAmountIncludingTax, 2) }}</td>
                                            <td>{{ number_format($inv->totalSalesTax, 2) }}</td>
                                            <td>{{ number_format($inv->totalfurtherTax, 2) }}</td>
                                            <td>{{ number_format($inv->totalextraTax, 2) }}</td>
                                            <td>
                                                <button type="button" class="btn btn-xs btn-outline-primary"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#itemsModal{{ $inv->invoice_id }}"
                                                    data-bs-toggle="tooltip" data-bs-placement="top" title="View Item">
                                                    <i class="fa-solid fa-eye fa-fw"></i>
                                                </button>
                                                <a href="{{ route('xero.print', Crypt::encryptString($inv->invoice_id)) }}"
                                                    class="btn btn-xs btn-outline-info" target="_blank"
                                                    data-bs-toggle="tooltip" data-bs-placement="top"
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
                            <div class="modal fade" id="itemsModal{{ $invoice->invoice_id }}" tabindex="-1"
                                aria-labelledby="itemsModalLabel{{ $invoice->invoice_id }}" aria-hidden="true">
                                <div class="modal-dialog modal-xl modal-dialog-scrollable">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Invoice Item Details</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                        </div>
                                        <div class="modal-body">

                                            @if($invoice->details->count())
                                            <div class="table-responsive">
                                                <table class="table table-sm table-bordered text-nowrap"
                                                    style="min-width: 1200px;">
                                                    <thead class="table-secondary">
                                                        <tr>
                                                            <th
                                                                style="width: 300px; white-space: normal; word-wrap: break-word;">
                                                                Description</th>
                                                            <th style="width: 100px;">Price</th>
                                                            <th style="width: 160px;">Tax Rate</th>
                                                            <th style="width: 80px;">Quantity</th>
                                                            <th style="width: 110px;">Val Inc Tax</th>
                                                            <th style="width: 120px;">Val Exc Tax</th>
                                                            <th style="width: 150px;">Sales Tax WithHeld</th>
                                                            <th style="width: 100px;">Extra Tax</th>
                                                            <th style="width: 100px;">Further Tax</th>
                                                            <th style="width: 120px;">Fed Payable</th>
                                                            <th style="width: 150px;">SRO Schedule #</th>
                                                            <th style="width: 160px;">SRO Item Serial #</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        @foreach ($invoice->details as $item)
                                                        <tr>
                                                            <td
                                                                style="white-space: normal; word-wrap: break-word; text-align: left; vertical-align: top;">
                                                                {{ $item->item->item_description ?? 'N/A' }}</td>
                                                            <td>{{ number_format($item->item->item_price, 2) }}</td>
                                                            <td>{{ number_format($item->item->item_tax_rate, 2) }}</td>
                                                            <td>{{ $item->quantity }}</td>
                                                            <td>{{ number_format($item->total_value, 2) }}</td>
                                                            <td>{{ number_format($item->value_excl_tax, 2) }}</td>
                                                            <td>{{ number_format($item->sales_tax_withheld, 2) }}</td>
                                                            <td>{{ number_format($item->extra_tax, 2) }}</td>
                                                            <td>{{ number_format($item->further_tax, 2) }}</td>
                                                            <td>{{ number_format($item->fed_payable, 2) }}</td>
                                                            <td>{{ number_format($item->sro_schedule_no, 2) }}</td>
                                                            <td>{{ number_format($item->sro_item_serial_no, 2) }}</td>
                                                        </tr>
                                                        @endforeach
                                                    </tbody>
                                                </table>
                                            </div>
                                            @else
                                            <p>No items found for this invoice.</p>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endforeach

                        </div>
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
<script>
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
        let currentPage = {{ $invoices->currentPage() }};
        let itemsPerPage = {{ $invoices->perPage() }};
        let totalItems = {{ $invoices->total() }};

        updateTableCount(currentPage, itemsPerPage, totalItems);
    });
</script>
@endsection