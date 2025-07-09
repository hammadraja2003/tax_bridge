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

    .table_setting {
        margin-right: calc(-0.5 * var(--bs-gutter-x));
        margin-left: calc(-0.5 * var(--bs-gutter-x));
    }

    /* Scrollbar Styling */
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

    /* Column Widths */
    #projectTableT th:nth-child(1),
    #projectTableT td:nth-child(1) {
        width: 300px; /* Description */
        text-align: left;
        white-space: normal;
        word-break: break-word;
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
        width: 100px; /* Actions */
    }

    .btn-xs {
        padding: 2px 6px;
        font-size: 13px;
    }

    .text-ellipsis {
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
        display: inline-block;
        width: 100%;
    }

    .employee {
        max-height: 4.5em;
        overflow: hidden;
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
                            <div class="app-scroll">
                                <table id="projectTableT" class="table table-striped table-bordered">
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
                                                <td class="employee">{{ $item->item_description }}</td>
                                                <td>{{ $item->item_hs_code }}</td>
                                                <td>{{ $item->item_price }}</td>
                                                <td>{{ $item->item_tax_rate }}</td>
                                                <td>{{ $item->item_uom }}</td>
                                                <td>
                                                    <a href="{{ route('items.edit', Crypt::encryptString($item->item_id)) }}" class="btn btn-outline-success btn-xs me-1">
                                                        <i class="ti ti-edit"></i>
                                                    </a>
                                                    <form action="{{ route('items.delete', $item->item_id) }}" method="POST" style="display:inline;">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="button" class="btn btn-outline-danger btn-xs delete-button">
                                                            <i class="ti ti-trash f-s-20"></i>
                                                        </button>
                                                    </form>
                                                </td>
                                            </tr>
                                        @endforeach
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
                    </div>
                   
                </div>
            </div>
        </div>
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

    // Call it here with actual backend values
    document.addEventListener('DOMContentLoaded', function () {
        let currentPage = 1;
        let itemsPerPage = 10; // You can change this to your actual value
        let totalItems = {{ count($items) }}; // Blade injects count of items

        let end = Math.min(currentPage * itemsPerPage, totalItems);
        updateTableCount(currentPage, itemsPerPage, totalItems);
    });
</script>
@endsection
