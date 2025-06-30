<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xero Invoices</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Xero Invoices from DB</h2>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <form action="{{ route('xero.post_to_fbr') }}" method="POST">
        @csrf
        <div class="mb-3">
            <button type="submit" class="btn btn-primary">Post Selected to FBR</button>
        </div>

        <table id="invoiceTable" class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th><input type="checkbox" id="checkAll"></th>
                    <th>Invoice Number</th>
                    <th>Type</th>
                    <th>Reference</th>
                    <th>Status</th>
                    <th>Currency</th>
                    <th>Total</th>
                    <th>Due Date</th>
                    <th>FBR Posted</th>
                    <th>FBR Invoice No.</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($invoices as $invoice)
                    <tr>
                        <td>
                            @if (!$invoice->posted_to_fbr)
                                <input type="checkbox" name="selected_invoices[]" value="{{ $invoice->id }}">
                            @endif
                        </td>
                        <td>{{ $invoice->invoice_number }}</td>
                        <td>{{ $invoice->type }}</td>
                        <td>{{ $invoice->reference }}</td>
                        <td>{{ $invoice->status }}</td>
                        <td>{{ $invoice->currency_code }}</td>
                        <td>{{ $invoice->total }}</td>
                        <td>{{ $invoice->due_date ? $invoice->due_date->format('Y-m-d') : '-' }}</td>
                        <td>{!! $invoice->posted_to_fbr ? '✅' : '❌' !!}</td>
                        <td>{{ $invoice->fbr_invoice_number ?? '-' }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#invoiceTable').DataTable();

        $('#checkAll').click(function () {
            $('input[name="selected_invoices[]"]').prop('checked', this.checked);
        });
    });
</script>
</body>
</html>
