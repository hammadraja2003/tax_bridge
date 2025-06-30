{{-- @extends('layouts.app')  --}}

{{-- @section('content') --}}
<div class="container">
    <h2>Xero Invoices</h2>
    <table border="1" cellpadding="8" cellspacing="0">
        <thead>
            <tr>
                <th>Invoice #</th>
                <th>Reference</th>
                <th>Date</th>
                <th>Due Date</th>
                <th>Status</th>
                <th>Sub Total</th>
                <th>Total Tax</th>
                <th>Total</th>
                <th>Amount Due</th>
            </tr>
        </thead>
        <tbody>
            @forelse($invoices as $invoice)
                <tr>
                    <td>{{ $invoice->getInvoiceNumber() }}</td>
                    <td>{{ $invoice->getReference() }}</td>
                    <td>{{ $invoice->getDate()}}</td>
                    <td>{{ $invoice->getDueDate() }}</td>
                    <td>{{ $invoice->getStatus() }}</td>
                    <td>{{ number_format($invoice->getSubTotal(), 2) }}</td>
                    <td>{{ number_format($invoice->getTotalTax(), 2) }}</td>
                    <td>{{ number_format($invoice->getTotal(), 2) }}</td>
                    <td>{{ number_format($invoice->getAmountDue(), 2) }}</td>
                </tr>
            @empty
                <tr>
                    <td colspan="9">No invoices found.</td>
                </tr>
            @endforelse
        </tbody>
    </table>
</div>
{{-- @endsection --}}
