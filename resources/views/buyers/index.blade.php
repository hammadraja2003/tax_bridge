@extends('layouts.admin')
@section('content')
<div class="container-fluid">
    <div class="row table_setting">
        <div class="col-xxl-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Client Details</h5>
                </div>
                <div class="card-body p-0">
                    {{-- Filter Section --}}
                    <div class="p-3 border-bottom">
                        <form method="GET" action="{{ route('buyers.index') }}" class="row g-3 align-items-end">
                            {{-- Buyer Type --}}
                            <div class="col-md-3">
                                <label for="byr_type" class="form-label">Client Type</label>
                                <select name="byr_type" id="byr_type" class="form-select">
                                    <option value="">All Types</option>
                                    <option value="1" {{ request('byr_type')==='1' ? 'selected' : '' }}>Registered
                                    </option>
                                    <option value="0" {{ request('byr_type')==='0' ? 'selected' : '' }}>Unregistered
                                    </option>
                                </select>
                            </div>

                            {{-- Search --}}
                            <div class="col-md-4">
                                <label for="search" class="form-label">Search</label>
                                <input type="text" name="search" id="search" class="form-control"
                                    placeholder="Name, CNIC, Address..." value="{{ request('search') }}">
                            </div>

                            {{-- Buttons --}}
                            <div class="col-md-5 text-end">
                                <button type="submit" class="btn btn-primary">Filter</button>
                                @if(request()->filled('byr_type') || request()->filled('search'))
                                <a href="{{ route('buyers.index') }}" class="btn btn-outline-secondary">Clear</a>
                                @endif
                            </div>
                        </form>
                    </div>

                    {{-- Buyer Table --}}
                    <div id="myTable">
                        <div class="list-table-header d-flex justify-content-between align-items-center p-3">
                            <a href="{{ route('buyer.create') }}" class="btn btn-primary">
                                <i class="fa-solid fa-plus fa-fw"></i>Add New Client
                            </a>
                            <form class="app-form app-icon-form" action="#">
                                <div class="position-relative">
                                    <input type="search" class="form-control search" placeholder="Search..."
                                        aria-label="Search">
                                </div>
                            </form>
                        </div>

                        <div class="app-scroll overflow-auto">
                            <table id="projectTableT" class="table table-striped table-bordered m-0">
                                <thead>
                                    <tr>
                                        <th>Logo</th>
                                        <th>Name</th>
                                        <th>Type</th>
                                        <th>NTN/CNIC</th>
                                        <th>Contact Person</th>
                                        <th>Contact #</th>
                                        <th>IBAN</th>
                                        <th>Account Title</th>
                                        <th>Account #</th>
                                        <th>Address</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse($buyers as $buyer)
                                    <tr>
                                        <td>
                                            @if($buyer->byr_logo)
                                            <img src="{{ asset('uploads/buyer_images/' . $buyer->byr_logo) }}"
                                                alt="Logo" width="50">
                                            @else
                                            N/A
                                            @endif
                                        </td>
                                        <td>{{ $buyer->byr_name }}</td>
                                        <td>
                                            @if($buyer->byr_type == 1)
                                            <span class="badge bg-success">Registered</span>
                                            @else
                                            <span class="badge bg-secondary">Unregistered</span>
                                            @endif
                                        </td>
                                        <td>{{ $buyer->byr_ntn_cnic }}</td>
                                        <td>{{ $buyer->byr_contact_person }}</td>
                                        <td>{{ $buyer->byr_contact_num }}</td>
                                        <td>{{ $buyer->byr_IBAN }}</td>
                                        <td>{{ $buyer->byr_account_title }}</td>
                                        <td>{{ $buyer->byr_account_number }}</td>
                                        <td>{{ $buyer->byr_address }}</td>
                                        <td>
                                            <a href="{{ route('buyers.edit', Crypt::encryptString($buyer->byr_id)) }}"
                                                class="btn btn-outline-success btn-sm me-1">
                                                <i class="ti ti-edit"></i>
                                            </a>
                                            <form action="{{ route('buyers.delete', $buyer->byr_id) }}" method="POST"
                                                class="d-inline">
                                                @csrf
                                                @method('DELETE')
                                                <button type="button"
                                                    class="btn btn-outline-danger btn-xs delete-button">
                                                    <i class="ti ti-trash f-s-20"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                    @empty
                                    <tr>
                                        <td colspan="11" class="text-center">No buyers found.</td>
                                    </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>

                        <div class="d-flex justify-content-between align-items-center px-3 py-2 small text-muted">
                            <div id="table-count-info">Showing 0 to 0 of 0 entries</div>
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

@endsection