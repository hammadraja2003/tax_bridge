<nav class="dark-sidebar">
      <div class="app-logo" style="background-color:#bc202e;">
          <a class="logo d-inline-block" href="index.html">
              <img src="{{ asset('assets/images/logo/secureism_logo_admin.png') }}" style="margin-bottom:4px;width:185px;" alt="#" class="dark-logo">
              <img src="assets/images/logo/1.png" alt="#" class="light-logo">
          </a>

          <span class="bg-light-light toggle-semi-nav">
            <i class="ti ti-chevrons-right f-s-20"></i>
          </span>
      </div>
      <div class="app-nav" id="app-simple-bar">
          <ul class="main-nav p-0 mt-2">
              <li class="menu-title">
                  <!-- <span>Admin Dashboard</span> -->
              </li>
              <li class="no-sub">
                  <a class="" href="/dashboard">
                  <i class="ti ti-home"></i> dashboard
                  <span class="badge text-bg-success badge-notification ms-2"></span>
                  </a>
              </li>
              <li class="no-sub">
                  <a class="" href="{{ route('invoice.create') }}">
                  <i class="ti ti-chart-treemap"></i>Create Invoice
                  </a>
              </li>
              <li>
                    <a class="" href="#maps" data-bs-toggle="collapse" aria-expanded="false">
                    <i class="fa-solid fa-brands fa-connectdevelop fa-fw"></i>Settings
                    </a>
                    <ul class="collapse" id="maps">
                        <li><a href="{{ url('/company/configuration') }}">Company Configuration</a></li>

                    </ul>
                </li>
             
             <!-- Hidden logout form -->
                <li class="no-sub">
                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                        @csrf
                    </form>

                    <!-- Styled logout link -->
                    <a href="#" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                    <i class="ti ti-logout pe-1 f-s-20"></i> Logout
                    </a>
                </li>

          </ul>
      </div>
      <div class="menu-navs">
          <span class="menu-previous"><i class="ti ti-chevron-left"></i></span>
          <span class="menu-next"><i class="ti ti-chevron-right"></i></span>
      </div>
  </nav>