<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>{{ config('app.name', 'Tax Bridge') }}</title>
  <style>
        body {
        font-family: Arial, sans-serif;
        font-size: 14px;
        color: #000;
        margin: 40px;
        }
        .container {
        width: 100%;
        max-width: 700px; /* adjust to fit A4 printable width */
        margin: auto;
        box-sizing: border-box;
        padding: 10px;
        }
        .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        }
        .logo img {
        width: 180px;
        }
        .top-row {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        margin-top: 20px;
        gap: 20px;
        }
        .top-section {
        /* width: 32%; */
        }
        .top-section h1 {
        font-size: 24px;
        margin-bottom: 10px;
        }
        .top-section p {
        line-height: 1.5;
        }
        .invoice-table, .payment-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        }
        .invoice-table th, .invoice-table td {
        border: 1px solid #000;
        padding: 8px 12px;
        text-align: left;
        }
        .invoice-table th {
        background-color: #f2f2f2;
        }
        .text-right {
        text-align: right;
        }
        .totals {
        margin-top: 10px;
        float: right;
        width: 300px;
        }
        .totals table {
        width: 100%;
        border-collapse: collapse;
        }
        .totals td {
        padding: 6px 10px;
        }
        .totals .label {
        font-weight: bold;
        }
        .due-info {
        margin-top: 40px;
        font-size: 14px;
        }
        .payment-advice {
        margin-top: 50px;
        border-top: 2px dashed #000;
        padding-top: 20px;
        }
        .payment-advice h2 {
        font-size: 20px;
        margin-bottom: 15px;
        }
        .footer {
        margin-top: 30px;
        font-size: 12px;
        }
  </style>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
 <script>
    window.onload = function () {
        const element = document.querySelector('.container');

        // Optional: force full width on screen to avoid cut-off
        element.style.width = '100%';

        const opt = {
            margin:       [0.3, 0.3, 0.3, 0.3], // top, left, bottom, right (in inches)
            filename:     'invoice-{{ $invoice->invoice_number }}.pdf',
            image:        { type: 'jpeg', quality: 0.98 },
            html2canvas:  {
                scale: 2,        // Increase to get higher-res rendering
                useCORS: true    // In case you're loading remote images
            },
            jsPDF: {
                unit: 'in',
                format: 'a4',
                orientation: 'portrait',
                putOnlyUsedFonts: true
            },
            pagebreak: { mode: ['avoid-all', 'css', 'legacy'] } // Try to avoid breaking sections
        };

        html2pdf().set(opt).from(element).save().then(() => {
            setTimeout(() => {
                window.print();
            }, 500);
        });
    };
</script>


</head>
<body>
  <div class="container">

    <div class="header">
      <div class="logo">
        <img src="{{ asset('assets/images/logo/secureism_logo.svg') }}" alt="Secureism Logo" style="height: 45px; width: 100%;">
      </div>
    </div>

    <div class="top-row">
      <!-- Left Section -->
      <div class="top-section">
        <h1>SALE TAX INVOICE</h1>
        <p><strong>Sky Pass Travel & Tours</strong><br>
        Office No 3, Mezzanine Floor, Rehman Plaza, Plot No. 75-East,<br>
        Fazal-e-Haq Road, Blue Area, Islamabad.</p>
      </div>

      <!-- Middle Section -->
      <div class="top-section">
        <p><strong>Invoice Date:</strong><br>{{ \Carbon\Carbon::parse($invoice->date)->format('d M Y') }}<br>
        <strong>Invoice Number:</strong> {{ $invoice->invoice_number }}<br>
        <strong>Reference:</strong>{{ $invoice->reference }}</p>
      </div>

      <!-- Right Section -->
      <div class="top-section" style="text-align: right;">
        <p><strong>SECUREISM (PRIVATE) LIMITED</strong><br>
        Innovation & Incubation<br>
        Floor-3rd F3 Centre of Information & Cyber Security<br>
        Sector B Zaraj Housing Scheme<br>
        Islamabad,<br>
        Company Registration No: 0119999.<br>
        NTN: 8923980-3</p>
      </div>
    </div>
    <table class="invoice-table">
        <thead>
            <tr>
                <th>Description</th>
                <th>Quantity</th>
                <th>Unit Price</th>
                <th>Tax</th>
                <th>Amount PKR</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($invoice->items as $item)
                <tr>
                    <td>{{ $item->description }}</td>
                    <td>{{ number_format($item->quantity, 2) }}</td>
                    <td>{{ number_format($item->unit_amount, 2) }}</td>
                    <td>
                        @php
                            $taxRate = $item->tax_rate ?? 15; // default 15% if not present
                        @endphp
                        {{ $taxRate }}%
                    </td>
                    <td>{{ number_format($item->line_amount, 2) }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
    
    <div class="totals" style="margin-top: 20px;">
        <table>
            <tr>
                <td class="label">Subtotal</td>
                <td class="text-right">{{ number_format($invoice->sub_total, 2) }}</td>
            </tr>
            <tr>
                <td class="label">
                    TOTAL SALE TAX ON SERVICES<br>
                    @if(count($invoice->items))
                        {{ $invoice->items[0]->tax_rate ?? 15 }}%
                    @else
                        15%
                    @endif
                </td>
                <td class="text-right">{{ number_format($invoice->total_tax, 2) }}</td>
            </tr>
            <tr>
                <td class="label"><strong>TOTAL PKR</strong></td>
                <td class="text-right"><strong>{{ number_format($invoice->total, 2) }}</strong></td>
            </tr>
        </table>
    </div>
    <div style="clear: both;"></div>

    <div class="due-info">
      <p><strong>Due Date:</strong> {{ \Carbon\Carbon::parse($invoice->due_date)->format('d M Y') }}<br>
      Title: Secureism Private Limited<br>
      Account No: 010100196750017<br>
      IBAN: PK44ABPA010100196750017<br>
      SWIFT CODE: ABPAPKKA<br>
      BANK NAME: ABL CHAKLALA SCHEME 3 RAWALPINDI<br>
      BranchCODE7057</p>
    </div>

    <div class="payment-advice">
      <h2>PAYMENT ADVICE</h2>
      <div style="display: flex; justify-content: space-between; gap: 40px;">
        
        <!-- Left: Company Address -->
        <div style="width: 50%;">
          <p><strong>To:</strong> SECUREISM (PRIVATE) LIMITED<br>
            Innovation & Incubation<br>
            Floor-3rd F3 Centre of Information & Cyber Security<br>
            Sector B Zaraj Housing Scheme, Islamabad<br>
            Company Registration No: 0119999<br>
            NTN: 8923980-3
          </p>
        </div>

        <!-- Right: Customer & Invoice Details -->
        <div style="width: 50%;">
          <table style="width: 100%; border-collapse: collapse;">
            <tr>
              <td style="padding: 4px;"><strong>Customer</strong></td>
              <td style="padding: 4px;">Sky Pass Travel & Tours</td>
            </tr>
            <tr>
              <td style="padding: 4px;"><strong>Invoice Number</strong></td>
              <td style="padding: 4px;">010824</td>
            </tr>
            <tr>
              <td style="padding: 4px;"><strong>Amount Due</strong></td>
              <td style="padding: 4px;">149,500.00</td>
            </tr>
            <tr>
              <td style="padding: 4px;"><strong>Due Date</strong></td>
              <td style="padding: 4px;">26 Aug 2024</td>
            </tr>
            <tr>
              <td style="padding: 4px;"><strong>Amount Enclosed</strong></td>
              <td style="padding: 4px;">__________________________</td>
            </tr>
          </table>
        </div>
      </div>
    </div>

    <div class="footer">
      Company Registration No: 0119999. Registered Office: Attention: SECUREISM (PRIVATE) LIMITED, Innovation & Incubation Floor-3rd F3 Centre of Information & Cyber Security Sector B Zaraj Housing Scheme Islamabad, Islamabad, Islamabad, 46000, Pakistan.
    </div>

  </div>
</body>
<script>
  function printAndDownloadPDF() {
    const element = document.querySelector('.container'); // the invoice area
    const opt = {
      margin:       0.3,
      filename:     'invoice.pdf',
      image:        { type: 'jpeg', quality: 0.98 },
      html2canvas:  { scale: 2 },
      jsPDF:        { unit: 'in', format: 'a4', orientation: 'portrait' }
    };

    // Download as PDF
    html2pdf().set(opt).from(element).save();

    // Optional: Print after short delay (wait for download to start)
    setTimeout(() => {
      window.print();
    }, 1000);
  }
</script>

</html>
