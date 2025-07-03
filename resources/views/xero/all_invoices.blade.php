@extends('layouts.admin')

@section('content')
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
            <div id="myTable">
              <div class="list-table-header d-flex justify-content-sm-between">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                  data-bs-target="#exampleModal">Add</button>
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                  aria-hidden="true">
                  <form id="add_employee_form">
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
                  </form>
                </div>

                <form class="app-form app-icon-form " action="#">
                  <div class="position-relative ">
                    <input type="search" class="form-control search" placeholder="Search..."
                      aria-label="Search">
                    <i class="ti ti-search text-dark"></i>
                  </div>
                </form>
              </div>

              <div class="app-scroll overflow-auto">
                <table class="table table-bottom-border  list-table-data align-middle mb-0">
                  <thead>
                    <tr class="app-sort">
                      <th>
                      <input class="form-check-input checkAll" type="checkbox" id="selectAll">
                      </th>
                      <th class="d-none">ID</th>
                      <th class="sort" data-sort="employee" scope="col">Employee</th>
                      <th class="sort" data-sort="email" scope="col">Email</th>
                      <th class="sort" data-sort="contact" scope="col">contact</th>
                      <th class="sort" data-sort="date" scope="col">Joining Date</th>
                      <th class="sort" data-sort="status" scope="col">Status</th>
                      <th class="sort" data-sort="action" scope="col">Edit</th>
                      <th class="sort" data-sort="action" scope="col">Delete</th>
                      <th class="sort" data-sort="action" scope="col">Print</th>
                    </tr>
                  </thead>
                  <tbody class="list" id="t-data">
                    <tr>
                    <th scope="row">
                    <input class="form-check-input row-check" type="checkbox" name="item" value="1">
                    </th>
                      <td class="id d-none">1</td>
                      <td class="employee">Allie Grater</td>
                      <td class="email">graterallie@gmail.com</td>
                      <td class="contact">8054478398</td>
                      <td class="date">2021-03-19</td>
                      <td class="status">
                        <span class="badge bg-danger-subtle text-danger text-uppercase">Block</span>
                      </td>
                      <td class="edit"><button class="btn edit-item-btn btn-sm btn-success"
                          data-bs-toggle="modal" data-bs-target="#exampleModal">Edit</button>
                      </td>
                      <td class="remove"><button class="btn remove-item-btn btn-sm btn-danger">Remove</button>
                      </td>
                      <a href="{{ route('invoice.print') }}" class="btn btn-primary" target="_blank">
                          View & Print Invoice
                      </a>
                    </tr>

                    <tr>
                      <th scope="row">
                      <input class="form-check-input row-check" type="checkbox" name="item" value="1">
                      </th>
                      <td class="id d-none">2</td>
                      <td class="employee">Rhoda Report</td>
                      <td class="email">reportrhoda@gmail.com</td>
                      <td class="contact">7765392112</td>
                      <td class="date">2020-01-19</td>
                      <td class="status"><span
                          class="badge bg-success-subtle text-success text-uppercase">Active</span>
                      </td>
                      <td class="edit"><button class="btn edit-item-btn btn-sm btn-success"
                          data-bs-toggle="modal" data-bs-target="#exampleModal">Edit</button>
                      </td>
                      <td class="remove"><button class="btn remove-item-btn btn-sm btn-danger">Remove</button>
                      </td>
                    </tr>

                    <tr>
                      <th scope="row">
                      <input class="form-check-input row-check" type="checkbox" name="item" value="1">
                      </th>
                      <td class="id d-none">3</td>
                      <td class="employee">Rose Bush</td>
                      <td class="email">rose@gmail.com</td>
                      <td class="contact">9674903425</td>
                      <td class="date">2020-10-26</td>
                      <td class="status"><span
                          class="badge bg-success-subtle text-success text-uppercase">Active</span>
                      </td>
                      <td class="edit"><button class="btn edit-item-btn btn-sm btn-success"
                          data-bs-toggle="modal" data-bs-target="#exampleModal">Edit</button>
                      </td>
                      <td class="remove"><button class="btn remove-item-btn btn-sm btn-danger">Remove</button>
                      </td>
                    </tr>

                    <tr>
                      <th scope="row">
                      <input class="form-check-input row-check" type="checkbox" name="item" value="1">
                      </th>
                      <td class="id d-none">4</td>
                      <td class="employee">Dave Allippa</td>
                      <td class="email">dave@gmail.com</td>
                      <td class="contact">6490537289</td>
                      <td class="date">2020-06-19</td>
                      <td class="status">
                        <span class="badge bg-danger-subtle text-danger text-uppercase">Block</span>
                      </td>
                      <td class="edit"><button class="btn edit-item-btn btn-sm btn-success"
                          data-bs-toggle="modal" data-bs-target="#exampleModal">Edit</button>
                      </td>
                      <td class="remove"><button class="btn remove-item-btn btn-sm btn-danger">Remove</button>
                      </td>
                    </tr>

                    <tr>
                      <th scope="row">
                      <input class="form-check-input row-check" type="checkbox" name="item" value="1">
                      </th>
                      <td class="id d-none">5</td>
                      <td class="employee">Emma Grate</td>
                      <td class="email">emma@gmail.com</td>
                      <td class="contact">9123456031</td>
                      <td class="date">2022-03-20</td>
                      <td class="status"><span
                          class="badge bg-danger-subtle text-danger text-uppercase">Block</span>
                      </td>
                      <td class="edit"><button class="btn edit-item-btn btn-sm btn-success"
                          data-bs-toggle="modal" data-bs-target="#exampleModal">Edit</button>
                      </td>
                      <td class="remove"><button class="btn remove-item-btn btn-sm btn-danger">Remove</button>
                      </td>
                    </tr>

                    <tr>
                      <th scope="row">
                      <input class="form-check-input row-check" type="checkbox" name="item" value="1">
                      </th>
                      <td class="id d-none">6</td>
                      <td class="employee">Mal Nurrisht</td>
                      <td class="email">Nurrishtmal@gmail.com</td>
                      <td class="contact">6490267839</td>
                      <td class="date">2019-12-29</td>
                      <td class="status"><span
                          class="badge bg-success-subtle text-success text-uppercase">Active</span>
                      </td>
                      <td class="edit"><button class="btn edit-item-btn btn-sm btn-success"
                          data-bs-toggle="modal" data-bs-target="#exampleModal">Edit</button>
                      </td>
                      <td class="remove"><button class="btn remove-item-btn btn-sm btn-danger">Remove</button>
                      </td>
                    </tr>

                    <tr>
                      <th scope="row">
                      <input class="form-check-input row-check" type="checkbox" name="item" value="1">
                      </th>
                      <td class="id d-none">7</td>
                      <td class="employee">Bess Twishes</td>
                      <td class="email">twishes@gmail.com</td>
                      <td class="contact">8702643868</td>
                      <td class="date">2020-5-16</td>
                      <td class="status"><span
                          class="badge bg-danger-subtle text-danger text-uppercase">Block</span>
                      </td>
                      <td class="edit"><button class="btn edit-item-btn btn-sm btn-success"
                          data-bs-toggle="modal" data-bs-target="#exampleModal">Edit</button>
                      </td>
                      <td class="remove"><button class="btn remove-item-btn btn-sm btn-danger">Remove</button>
                      </td>
                    </tr>

                    <tr>
                      <th scope="row">
                      <input class="form-check-input row-check" type="checkbox" name="item" value="1">
                      </th>
                      <td class="id d-none">8</td>
                      <td class="employee">C. Yasoon</td>
                      <td class="email">yasoon@gmail.com</td>
                      <td class="contact">9345067125</td>
                      <td class="date">2022-02-16</td>
                      <td class="status"><span
                          class="badge bg-success-subtle text-success text-uppercase">Active</span>
                      </td>
                      <td class="edit"><button class="btn edit-item-btn btn-sm btn-success"
                          data-bs-toggle="modal" data-bs-target="#exampleModal">Edit</button>
                      </td>
                      <td class="remove"><button class="btn remove-item-btn btn-sm btn-danger">Remove</button>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div class="list-pagination">
                <ul class="pagination"></ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Table with Pagination Table end -->
    </div>
    <!-- List Js Table end -->
  </div>
<script>
  // When header checkbox is clicked
  document.querySelector('.checkAll').addEventListener('change', function () {
    const isChecked = this.checked;
    document.querySelectorAll('.row-check').forEach(function (checkbox) {
      checkbox.checked = isChecked;
    });
  });

  // Optional: If you want to uncheck header checkbox if one row is unchecked
  document.querySelectorAll('.row-check').forEach(function (checkbox) {
    checkbox.addEventListener('change', function () {
      const all = document.querySelectorAll('.row-check').length;
      const checked = document.querySelectorAll('.row-check:checked').length;
      document.querySelector('.checkAll').checked = all === checked;
    });
  });
</script>

@endsection