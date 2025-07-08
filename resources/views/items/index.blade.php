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
                margin-right: calc(-0.5 * var(--bs-gutter-x));
                margin-left: calc(-0.5 * var(--bs-gutter-x));
            }
            .btn-outline-success:hover .text-success {
                color: #fff !important;
            } 
            #projectTableT th,
                #projectTableT td {
                    padding: 6px 10px !important; /* reduce vertical & horizontal padding */
                    white-space: nowrap;
                }

                #projectTableT td.employee {
                    white-space: normal !important; /* allow wrapping only for description */
                    max-width: 250px;
                }

                #projectTableT {
                    border-collapse: collapse;
                    width: 100%;
                }

                /* Optional: reduce font size slightly */
                #projectTableT td, 
                #projectTableT th {
                    font-size: 14px;
                }
</style>

<div class="container">
    <div class="container-fluid">
        <div class="row table_setting">
            <div class="col-xxl-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Service Details</h5>
                        <a href="{{ url()->previous() }}" class="btn btn-outline-dark">
                            <i class="fa-solid fa-step-backward fa-fw me-1"></i>Back
                        </a>
                    </div>
                    <div class="card-body p-0">
                      
                        <div id="myTable">
                            <div class="list-table-header d-flex justify-content-between align-items-center px-3 py-2">
                                <a href="{{ route('items.create') }}" class="btn btn-outline-secondary">
                                    <i class="fa-solid fa-plus fa-fw"></i>Add New Item
                                </a>
                                <form class="app-form app-icon-form" action="#">
                                    <div class="position-relative">
                                        <input type="search" class="form-control search" placeholder="Search..." aria-label="Search">
                                    </div>
                                </form>
                            </div>
                            <div class="app-scroll overflow-auto" style="max-width: 100%;">
                                <table id="projectTableT" class="app-scroll table-responsive">
                                    <thead>
                                        <tr>
                                            <th>Description</th>
                                            <th>HS Code</th>
                                            <th>Price</th>
                                            <th>Tax Rate</th>
                                            <th>UOM</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody class="list" id="t-data">
                                        @foreach($items as $item)
                                            <tr>
                                                <td class="employee" style="white-space: normal; max-width: 200px;">{{ $item->item_description }}</td>
                                                <td class="email">{{ $item->item_hs_code }}</td>
                                                <td class="email">{{ $item->item_price }}</td>
                                                <td class="contact">{{ $item->item_tax_rate }}</td>
                                                <td class="date">{{ $item->item_uom }}</td>
                                                <td>
                                                    <a href="{{ route('items.edit', $item->item_id) }}" class="btn btn-xs btn-outline-success"><i class="ti ti-edit f-s-20 text-success"></i></a>
                                                    <form action="{{ route('items.delete', $item->item_id) }}" method="POST" style="display:inline;">
                                                        @csrf
                                                        <button onclick="return confirm('Delete this item?')" class="btn btn-outline-danger btn-xs"><i class="ti ti-trash f-s-20"></i></button>
                                                    </form>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                            <div class="list-pagination">
                                <ul class="pagination"></ul>
                            </div>
                        </div> <!-- myTable -->
                    </div> <!-- card-body -->
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

