<nav class="dark-sidebar">
    <div class="app-logo">
        <a class="logo d-inline-block" href="#">
            <img src="{{ asset('assets/images/logo/secureism_logo_admin.png') }}" alt="#" class="dark-logo">
            <img src="{{ asset('assets/images/logo/1.png') }}" alt="#" class="light-logo">
        </a>
        <span class="bg-light-light toggle-semi-nav">
            <i class="ti ti-chevrons-right f-s-20"></i>
        </span>
    </div>
    <div class="app-nav" id="app-simple-bar">
        <ul class="main-nav p-0 mt-2">
            <li class="no-sub">
                <a class="" href="/dashboard">
                    <i class="ti ti-home"></i> dashboard
                    <span class="badge text-bg-success badge-notification ms-2"></span>
                </a>
            </li>
            <li class="no-sub">
                @php
                $isInvoiceRoute = request()->routeIs('invoices.*');
                $isCompanyeRoute = request()->routeIs('company.*');
                $isBuyersRoute = request()->routeIs('buyers.*');
                $isItemsRoute = request()->routeIs('items.*');
                @endphp
                <a class="{{ $isInvoiceRoute ? 'activeTab' : '' }}" href="{{ route('invoices.index') }}">
                    <i class="ti ti-chart-treemap"></i>Invoices
                </a>
            </li>
            <li>
                <a class="" href="#maps" data-bs-toggle="collapse" aria-expanded="false">
                    <i class="fa-solid fa-brands fa-connectdevelop fa-fw"></i>Settings
                </a>
                <ul class="collapse" id="maps">
                    <li>
                        <a class="{{ $isCompanyeRoute ? 'activeTab' : '' }}"
                            href="{{ route('company.configuration') }}">Configuration</a>
                    </li>

                    <li>
                        <a class="{{ $isBuyersRoute ? 'activeTab' : '' }}"
                            href="{{ route('buyers.index') }}">Clients</a>
                    </li>
                    <li>
                        <a class="{{ $isItemsRoute ? 'activeTab' : '' }}" href="{{ route('items.index') }}">Items /
                            Services</a>
                    </li>
                </ul>
            </li>
            <!-- Hidden logout form -->
            <li class="no-sub">
                <form id="logout-form" action="{{ route('logout') }}" method="POST">
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