
<div class="container mt-5">
    <div class="alert alert-danger">
        <h4 class="alert-heading">⚠️ Xero Integration Error</h4>
        <p>{{ session('error') ?? 'An unknown error occurred while connecting with Xero.' }}</p>
        <hr>
        <a href="{{ route('xero.connect') }}" class="btn btn-primary">Reconnect to Xero</a>
        <a href="{{ url()->previous() }}" class="btn btn-secondary">Go Back</a>
    </div>
</div>
