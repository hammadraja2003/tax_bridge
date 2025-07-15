document.addEventListener("DOMContentLoaded", function () {
    const tooltipTriggerList = [].slice.call(
        document.querySelectorAll('[data-bs-toggle="tooltip"]')
    );
    tooltipTriggerList.forEach(function (tooltipTriggerEl) {
        new bootstrap.Tooltip(tooltipTriggerEl);
    });
});
function toggleInvoiceRef() {
    const invoiceType = document.getElementById("invoiceType").value;
    const invoiceRefWrapper = document.getElementById("invoiceRefWrapper");
    const invoiceRefInput = document.getElementById("invoiceRefNo");
    if (invoiceType === "Debit Note") {
        invoiceRefWrapper.style.display = "block";
        invoiceRefInput.setAttribute("required", "required");
    } else {
        invoiceRefWrapper.style.display = "none";
        invoiceRefInput.removeAttribute("required");
        invoiceRefInput.value = "";
    }
}
$(document).ready(function () {
    $("#byr_id").change(function () {
        const id = $(this).val();
        if (!id) {
            // Clear all fields if nothing selected
            $("[name=buyerNTNCNIC]").val("");
            $("[name=buyerAddress]").val("");
            $("[name=buyerProvince]").val("");
            $("[name=buyerRegistrationType]").val("");
            return;
        }
        $.get("/buyers/" + id, function (b) {
            $("[name=buyerNTNCNIC]").val(b.byr_ntn_cnic);
            $("[name=buyerAddress]").val(b.byr_address);
            $("[name=buyerProvince]").val(b.byr_province);
            $("[name=buyerRegistrationType]").val(
                b.byr_type == 1 ? "Registered" : "Unregistered"
            );
        });
    });
});
function parseFloatSafe(value) {
    const num = parseFloat(value);
    return isNaN(num) ? 0 : num;
}

function showWarningIfInvalid($field, label = "This") {
    const val = parseFloatSafe($field.val());
    if (val <= 0) {
        $field.addClass("is-invalid");
        $field[0].setCustomValidity("Must be greater than zero");
        $field
            .closest(".form-group, .col-md-4")
            .find(".invalid-feedback")
            .remove();
        $field.after(
            `<div class="invalid-feedback">${label} must be greater than zero.</div>`
        );
        return false;
    } else {
        $field.removeClass("is-invalid").removeAttr("data-invalid");
        $field[0].setCustomValidity("");
        $field
            .closest(".form-group, .col-md-4")
            .find(".invalid-feedback")
            .remove();
        return true;
    }
}

function updateSubmitButton() {
    $("#submitBtn").toggle($(".item-group").length > 0);
}

let itemIndex = 0;
function addItem() {
    const $template = $($("#itemTemplate").html());

    // Inject Tax Amount field before the last column
    const taxField = `
    <div class="col-md-4">
      <label class="form-label">Tax Amount</label>
      <input type="number" name="items[${itemIndex}][calculatedTax]" class="form-control" readonly />
    </div>`;
    $template.find(".row.g-3 .col-12.text-end").before(taxField);

    // Fix name attributes to include the current itemIndex
    $template.find("input, select, textarea").each(function () {
        const name = $(this).attr("name");
        if (name) {
            const newName = name.replace("items[][", `items[${itemIndex}][`);
            $(this).attr("name", newName);
        }
    });

    $("#itemsContainer").append($template);
    itemIndex++; // Increment index after use
    updateSubmitButton();
}

function calculateRow($row) {
    const qtyField = $row.find('[name$="[quantity]"]');
    const priceField = $row.find('[name$="[item_price]"]');
    const taxRateField = $row.find('[name$="[SalesTaxApplicable]"]');

    const qty = parseFloatSafe(qtyField.val());
    const itemPrice = parseFloatSafe(priceField.val());
    const taxRate = parseFloatSafe(taxRateField.val());

    const validQty = showWarningIfInvalid(qtyField, "Quantity");
    const validPrice = showWarningIfInvalid(priceField, "Item Price");
    const validTax = showWarningIfInvalid(taxRateField, "Tax Rate");

    if (!validQty || !validPrice || !validTax) return;

    const totalExclTax = qty * itemPrice;
    const taxAmount = totalExclTax * (taxRate / 100);
    const totalInclTax = totalExclTax + taxAmount;

    $row.find('[name$="[valueSalesExcludingST]"]').val(totalExclTax.toFixed(2));
    $row.find('[name$="[totalValues]"]').val(totalInclTax.toFixed(2));
    $row.find('[name$="[calculatedTax]"]').val(taxAmount.toFixed(2));
}

function updateTotals() {
    let totalAmountExcludingTax = 0;
    let totalAmountIncludingTax = 0;
    let totalTax = 0;

    $(".item-group").each(function () {
        const $row = $(this);
        const exclVal = parseFloatSafe(
            $row.find('[name$="[valueSalesExcludingST]"]').val()
        );
        const totalVal = parseFloatSafe(
            $row.find('[name$="[totalValues]"]').val()
        );

        totalAmountExcludingTax += exclVal;
        totalAmountIncludingTax += totalVal;
        totalTax += totalVal - exclVal;
    });

    $("#totalAmountExcludingTax").val(totalAmountExcludingTax.toFixed(2));
    $("#totalAmountIncludingTax").val(totalAmountIncludingTax.toFixed(2));
    $("#totalSalesTax").val(totalTax.toFixed(2));
}

$(document).ready(function () {
    // Initial item
    // addItem();

    // Add new item
    $(document).on("click", ".add-item", function () {
        addItem();
    });

    // Remove item
    $(document).on("click", ".remove-item", function () {
        $(this).closest(".item-group").remove();
        updateSubmitButton();
        updateTotals();
    });

    // On item change → auto-fill & calculate
    $(document).on("change", ".item-select", function () {
        const $row = $(this).closest(".item-group");
        const opt = $(this).find("option:selected");

        $row.find('[name$="[hsCode]"]').val(opt.data("hs") || "");
        $row.find('[name$="[rate]"]').val(opt.data("tax") || "");
        $row.find('[name$="[uoM]"]').val(opt.data("uom") || "");
        $row.find('[name$="[productDescription]"]').val(
            opt.data("description") || ""
        );
        $row.find('[name$="[item_price]"]').val(opt.data("price") || "");
        $row.find('[name$="[SalesTaxApplicable]"]').val(opt.data("tax") || "");

        calculateRow($row);
        updateTotals();
    });

    // Live input recalculates
    $(document).on(
        "input",
        '[name$="[quantity]"], [name$="[item_price]"], [name$="[SalesTaxApplicable]"]',
        function () {
            const $row = $(this).closest(".item-group");
            calculateRow($row);
            updateTotals();
        }
    );
});
function parseFloatSafe(val) {
    return parseFloat(val) || 0;
}

function updateTaxTotalsFromItems() {
    let totalfurtherTax = 0;
    let totalextraTax = 0;

    $(".item-group").each(function () {
        const $row = $(this);
        const furtherTax = parseFloatSafe(
            $row.find('[name$="[furtherTax]"]').val()
        );
        const extraTax = parseFloatSafe(
            $row.find('[name$="[extraTax]"]').val()
        );

        totalfurtherTax += furtherTax;
        totalextraTax += extraTax;
    });

    $("#totalfurtherTax").val(totalfurtherTax.toFixed(2));
    $("#totalextraTax").val(totalextraTax.toFixed(2));
}

$(document).ready(function () {
    $("#itemsContainer").on(
        "input",
        '[name$="[furtherTax]"], [name$="[extraTax]"]',
        function () {
            updateTaxTotalsFromItems();
        }
    );
});
document.addEventListener("DOMContentLoaded", function () {
    const registrationType = document.getElementById("buyerRegistrationType");
    const optionalFields = document.querySelectorAll(".optional-field");

    if (!registrationType) return; // Exit if the element doesn't exist

    function updateFieldRequirements() {
        const isUnregistered = registrationType.value === "Unregistered";

        optionalFields.forEach((field) => {
            if (isUnregistered) {
                field.removeAttribute("required");
            } else {
                field.setAttribute("required", "required");
            }
        });
    }

    registrationType.addEventListener("change", updateFieldRequirements);
    updateFieldRequirements(); // Run on page load as well
});

document.addEventListener("DOMContentLoaded", function () {
    const draftBtn = document.getElementById("draftBtn");
    const invoiceStatus = document.getElementById("invoice_status");

    if (draftBtn && invoiceStatus) {
        draftBtn.addEventListener("click", function () {
            invoiceStatus.value = 1;
        });
    }
});

document.addEventListener("DOMContentLoaded", function () {
    const submitBtn = document.getElementById("submitBtn");
    const invoiceStatus = document.getElementById("invoice_status");

    if (submitBtn && invoiceStatus) {
        submitBtn.addEventListener("click", function () {
            invoiceStatus.value = 2;
        });
    }
});

if (window.isEdit) {
    $(document).ready(function () {
        $("#byr_id").trigger("change");
    });
}

if (window.isEdit) {
    document.addEventListener("DOMContentLoaded", function () {
        setTimeout(() => {
            window.existingItems.forEach((item, index) => {
                addItem(); // Adds and increments itemIndex
                const $row = $(".item-group").last();

                const $select = $row.find('[name$="[item_id]"]');
                $select.val(item.item_id);

                // Trigger change in a short delay to ensure the DOM is ready
                setTimeout(() => {
                    $select.trigger("change");
                }, 10); // tiny delay

                // Fill other fields immediately after
                $row.find('[name$="[hsCode]"]').val(item.hs_code);
                $row.find('[name$="[productDescription]"]').val(
                    item.product_description
                );
                $row.find('[name$="[item_price]"]').val(item.item_price);
                $row.find('[name$="[rate]"]').val(item.rate);
                $row.find('[name$="[uoM]"]').val(item.uo_m);
                $row.find('[name$="[quantity]"]').val(item.quantity);
                $row.find('[name$="[valueSalesExcludingST]"]').val(
                    item.value_sales_excluding_st
                );
                $row.find('[name$="[totalValues]"]').val(item.total_values);
                $row.find('[name$="[fixedNotifiedValueOrRetailPrice]"]').val(
                    item.fixed_notified_value_or_retail_price
                );
                $row.find('[name$="[SalesTaxApplicable]"]').val(
                    item.sales_tax_applicable
                );
                $row.find('[name$="[SalesTaxWithheldAtSource]"]').val(
                    item.sales_tax_withheld_at_source
                );
                $row.find('[name$="[saleType]"]').val(item.sale_type);
                $row.find('[name$="[furtherTax]"]').val(item.further_tax);
                $row.find('[name$="[extraTax]"]').val(item.extra_tax);
                $row.find('[name$="[fedPayable]"]').val(item.fed_payable);
                $row.find('[name$="[discount]"]').val(item.discount);
                $row.find('[name$="[sroScheduleNo]"]').val(
                    item.sro_schedule_no
                );
                $row.find('[name$="[sroItemSerialNo]"]').val(
                    item.sro_item_serial_no
                );
            });
        }, 0); // Ensure rows are ready before starting
    });
} else {
    addItem();
}

document.addEventListener("DOMContentLoaded", function () {
    const togglePassword = document.getElementById("togglePassword");
    const passwordInput = document.getElementById("password");

    if (togglePassword && passwordInput) {
        const icon = togglePassword.querySelector("i");

        togglePassword.addEventListener("click", function () {
            const type =
                passwordInput.getAttribute("type") === "password"
                    ? "text"
                    : "password";
            passwordInput.setAttribute("type", type);

            if (icon) {
                icon.classList.toggle("fa-eye");
                icon.classList.toggle("fa-eye-slash");
            }
        });
    }
});

document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form");
    const submitBtn = form?.querySelector('button[type="submit"]');

    if (form && submitBtn) {
        // Prevent Enter key from submitting form (except in textarea)
        form.addEventListener("keydown", function (e) {
            if (e.key === "Enter" && e.target.tagName !== "TEXTAREA") {
                e.preventDefault();
            }
        });

        form.addEventListener("submit", function (e) {
            // Trim all text inputs and textareas
            const inputs = form.querySelectorAll(
                'input[type="text"], textarea'
            );
            inputs.forEach((input) => (input.value = input.value.trim()));

            // Disable the submit button and show spinner
            submitBtn.disabled = true;
            submitBtn.innerHTML =
                '<span class="spinner-border spinner-border-sm me-1"></span> Saving...';
        });
    }
});

document.addEventListener("DOMContentLoaded", function () {
    // Delete confirmation
    document.querySelectorAll(".delete-button").forEach((button) => {
        button.addEventListener("click", function (e) {
            const form = this.closest("form");
            Swal.fire({
                title: "Are you sure?",
                text: "This action cannot be undone!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#e3342f",
                cancelButtonColor: "#6c757d",
                confirmButtonText: "Yes, delete it!",
                reverseButtons: true,
            }).then((result) => {
                if (result.isConfirmed) {
                    form.submit();
                }
            });
        });
    });
});
document.addEventListener("DOMContentLoaded", function () {
    const toastDiv = document.getElementById("toast-data");

    if (toastDiv) {
        const message = toastDiv.dataset.toastMessage;
        const isError = toastDiv.dataset.toastError === "true";

        Toastify({
            text: (isError ? "❌ " : "✅ ") + message,
            duration: 3000,
            gravity: "top",
            position: "right",
            close: true,
            style: {
                background: isError ? "#dc3545" : "#28a745",
            },
        }).showToast();
    }
});

document.addEventListener("DOMContentLoaded", function () {
    var tooltipTriggerList = [].slice.call(
        document.querySelectorAll('[data-bs-toggle="tooltip"]')
    );
    tooltipTriggerList.forEach(function (tooltipTriggerEl) {
        new bootstrap.Tooltip(tooltipTriggerEl);
    });
});
