<!-- views/xero/invoices_db.blade.php -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xero Invoices</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap & DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Xero Invoices (Stored in DB)</h2>

    @if(session('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            {{ session('success') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    @endif

    @if(session('error'))
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            {{ session('error') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    @endif

    <div class="btn-group mb-3">
        <a href="{{ route('xero.disconnect') }}" class="btn btn-danger">🔌 Disconnect Xero</a>
        <a href="{{ route('xero.connect') }}" class="btn btn-success">🔄 Reconnect Xero</a>
        <a href="{{ route('xero.invoices') }}" class="btn btn-secondary">🔃 Sync Latest Invoices</a>
    </div>

    <form action="{{ route('xero.post_to_fbr') }}" method="POST">
        @csrf

        <div class="mb-3">
            <button type="submit" class="btn btn-primary">📤 Post Selected to FBR</button>
        </div>

        <div class="table-responsive">
            <table id="invoiceTable" class="table table-bordered table-striped">
                <thead class="table-light">
                <tr>
                    <th><input type="checkbox" id="checkAll"></th>
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
                        <td>{{ number_format($invoice->total, 2) }}</td>
                        <td>{{ number_format($invoice->sub_total, 2) }}</td>
                        <td>{{ number_format($invoice->total_tax, 2) }}</td>
                        <td>{{ number_format($invoice->amount_due, 2) }}</td>
                        <td>{{ number_format($invoice->amount_paid, 2) }}</td>
                        <td>{{ number_format($invoice->amount_credited, 2) }}</td>
                        <td>{{ $invoice->is_discounted ? 'Yes' : 'No' }}</td>
                        <td>{{ $invoice->has_attachments ? 'Yes' : 'No' }}</td>
                        <td>{{ optional($invoice->date)->format('d-m-Y H:i') ?? '-' }}</td>
                        <td>{{ optional($invoice->due_date)->format('d-m-Y H:i') ?? '-' }}</td>
                        <td>{{ optional($invoice->updated_date_utc)->format('Y-m-d H:i') ?? '-' }}</td>
                        <td>{{ $invoice->branding_theme_id ?? '-' }}</td>
                        <td>{{ $invoice->line_amount_types ?? '-' }}</td>
                        <td>{{ $invoice->currency_rate ?? '-' }}</td>
                        <td>{{ $invoice->repeating_invoice_id ?? '-' }}</td>
                        <td>{{ optional($invoice->fully_paid_on_date)->format('Y-m-d H:i') ?? '-' }}</td>
                        <td>{!! $invoice->posted_to_fbr ? '✅' : '❌' !!}</td>
                        <td>{{ $invoice->fbr_invoice_number ?? '-' }}</td>
                        <td>{{ $invoice->tenant_id ?? '-' }}</td>
                        <td>{{ $invoice->tenant_name ?? '-' }}</td>
                        <td>{{ $invoice->tenant_type ?? '-' }}</td>
                        <td>{{ optional($invoice->tenant_created_at)->format('Y-m-d H:i') ?? '-' }}</td>
                        <td>{{ optional($invoice->tenant_updated_at)->format('Y-m-d H:i') ?? '-' }}</td>
                        <td>{{ $invoice->organisation_id ?? '-' }}</td>
                        <td>
                            <button type="button" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#itemsModal{{ $invoice->id }}">
                                View Items
                            </button>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </form>

    <!-- Modals -->
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
</div>

<!-- JS CDN -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

<script>
    $(document).ready(function () {
        $('#invoiceTable').DataTable({
            pageLength: 10,
            responsive: true
        });

        $('#checkAll').on('click', function () {
            $('input[name="selected_invoices[]"]').prop('checked', this.checked);
        });
    });
</script>

</body>
</html>
