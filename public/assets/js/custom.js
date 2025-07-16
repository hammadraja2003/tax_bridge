// custom.js - Refactored and Modular

document.addEventListener("DOMContentLoaded", function () {
    initTooltips();
    initBuyerChangeHandler();
    initItemHandlers();
    initFormBehavior();
    initToastMessage();
    initPasswordToggle();
    initInvoiceStatusButtons();
    initDeleteConfirmation();
    initEditInvoiceItems();
    // toggleInvoiceRef();
});

function initTooltips() {
    const tooltipTriggerList = [].slice.call(
        document.querySelectorAll('[data-bs-toggle="tooltip"]')
    );
    tooltipTriggerList.forEach((el) => new bootstrap.Tooltip(el));
}

function initBuyerChangeHandler() {
    const buyerSelect = document.getElementById("byr_id");
    const loader = document.getElementById("buyerLoader");

    if (!buyerSelect) return;

    buyerSelect.addEventListener("change", function () {
        const id = this.value;

        // Clear fields if no buyer selected
        if (!id) {
            [
                "buyerNTNCNIC",
                "buyerAddress",
                "buyerProvince",
                "buyerRegistrationType",
            ].forEach((field) => {
                const input = document.querySelector(`[name=${field}]`);
                if (input) input.value = "";
            });
            return;
        }

        if (loader) loader.classList.remove("d-none"); // Show loader

        fetch(`/buyers/${id}`)
            .then((res) => res.json())
            .then((b) => {
                document.querySelector("[name=buyerNTNCNIC]").value =
                    b.byr_ntn_cnic || "";
                document.querySelector("[name=buyerAddress]").value =
                    b.byr_address || "";
                document.querySelector("[name=buyerProvince]").value =
                    b.byr_province || "";
                document.querySelector("[name=buyerRegistrationType]").value =
                    b.byr_type == 1 ? "Registered" : "Unregistered";
            })
            .catch(() => {
                alert("Failed to fetch buyer details.");
            })
            .finally(() => {
                if (loader) loader.classList.add("d-none"); // Hide loader
            });
    });
}

// Run this after DOM is ready
document.addEventListener("DOMContentLoaded", initBuyerChangeHandler);

function initItemHandlers() {
    if (!document.getElementById("itemsContainer")) return;

    $(document).on("click", ".add-item", addItem);
    $(document).on("click", ".remove-item", function () {
        $(this).closest(".item-group").remove();
        updateSubmitButton();
        updateTotals();
    });
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
    $(document).on(
        "input",
        '[name$="[quantity]"], [name$="[item_price]"], [name$="[SalesTaxApplicable]"]',
        function () {
            const $row = $(this).closest(".item-group");
            calculateRow($row);
            updateTotals();
        }
    );
    $("#itemsContainer").on(
        "input",
        '[name$="[furtherTax]"], [name$="[extraTax]"]',
        updateTaxTotalsFromItems
    );
}

function addItem() {
    const $template = $($("#itemTemplate").html());
    const taxField = `<div class="col-md-4"><label class="form-label">Tax Amount</label><input type="number" name="items[${itemIndex}][calculatedTax]" class="form-control" readonly /></div>`;
    $template.find(".row.g-3 .col-12.text-end").before(taxField);

    $template.find("input, select, textarea").each(function () {
        const name = $(this).attr("name");
        if (name) {
            $(this).attr(
                "name",
                name.replace("items[][", `items[${itemIndex}][`)
            );
        }
    });

    $("#itemsContainer").append($template);
    itemIndex++;
    updateSubmitButton();
}

function updateSubmitButton() {
    $("#submitBtn").toggle($(".item-group").length > 0);
}

function calculateRow($row) {
    const qty = parseFloatSafe($row.find('[name$="[quantity]"]').val());
    const price = parseFloatSafe($row.find('[name$="[item_price]"]').val());
    const taxRate = parseFloatSafe(
        $row.find('[name$="[SalesTaxApplicable]"]').val()
    );

    const taxAmount = qty * price * (taxRate / 100);
    const excl = qty * price;
    const incl = excl + taxAmount;

    $row.find('[name$="[valueSalesExcludingST]"]').val(excl.toFixed(2));
    $row.find('[name$="[totalValues]"]').val(incl.toFixed(2));
    $row.find('[name$="[calculatedTax]"]').val(taxAmount.toFixed(2));
}

function updateTotals() {
    let excl = 0,
        incl = 0;
    $(".item-group").each(function () {
        excl += parseFloatSafe(
            $(this).find('[name$="[valueSalesExcludingST]"]').val()
        );
        incl += parseFloatSafe($(this).find('[name$="[totalValues]"]').val());
    });
    $("#totalAmountExcludingTax").val(excl.toFixed(2));
    $("#totalAmountIncludingTax").val(incl.toFixed(2));
    $("#totalSalesTax").val((incl - excl).toFixed(2));
}

function updateTaxTotalsFromItems() {
    let totalfurtherTax = 0,
        totalextraTax = 0;
    $(".item-group").each(function () {
        totalfurtherTax += parseFloatSafe(
            $(this).find('[name$="[furtherTax]"]').val()
        );
        totalextraTax += parseFloatSafe(
            $(this).find('[name$="[extraTax]"]').val()
        );
    });
    $("#totalfurtherTax").val(totalfurtherTax.toFixed(2));
    $("#totalextraTax").val(totalextraTax.toFixed(2));
}

function parseFloatSafe(val) {
    return parseFloat(val) || 0;
}

function initFormBehavior() {
    const form = document.querySelector("form");
    const submitBtn = form?.querySelector('button[type="submit"]');

    if (!form || !submitBtn) return;

    form.addEventListener("keydown", function (e) {
        if (e.key === "Enter" && e.target.tagName !== "TEXTAREA") {
            e.preventDefault();
        }
    });

    form.addEventListener("submit", function () {
        form.querySelectorAll('input[type="text"], textarea').forEach(
            (input) => {
                input.value = input.value.trim();
            }
        );

        submitBtn.disabled = true;
        submitBtn.innerHTML =
            '<span class="spinner-border spinner-border-sm me-1"></span> Saving...';
    });
}

function initToastMessage() {
    const toastDiv = document.getElementById("toast-data");
    if (!toastDiv) return;

    Toastify({
        text:
            (toastDiv.dataset.toastError === "true" ? "❌ " : "✅ ") +
            toastDiv.dataset.toastMessage,
        duration: 3000,
        gravity: "top",
        position: "right",
        close: true,
        style: {
            background:
                toastDiv.dataset.toastError === "true" ? "#dc3545" : "#28a745",
        },
    }).showToast();
}

function initPasswordToggle() {
    const togglePassword = document.getElementById("togglePassword");
    const passwordInput = document.getElementById("password");
    if (!togglePassword || !passwordInput) return;

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

function initInvoiceStatusButtons() {
    const draftBtn = document.getElementById("draftBtn");
    const submitBtn = document.getElementById("submitBtn");
    const invoiceStatus = document.getElementById("invoice_status");

    draftBtn?.addEventListener("click", () => (invoiceStatus.value = 1));
    submitBtn?.addEventListener("click", () => (invoiceStatus.value = 2));
}

function initDeleteConfirmation() {
    document.querySelectorAll(".delete-button").forEach((button) => {
        button.addEventListener("click", function () {
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
                if (result.isConfirmed) form.submit();
            });
        });
    });
}
const raw = document.getElementById("invoice-data")?.textContent;
if (raw) {
    const data = JSON.parse(raw);
    window.isEdit = !!data.isEdit;
    window.existingItems = data.existingItems || [];
} else {
    window.isEdit = false;
    window.existingItems = [];
}

function initEditInvoiceItems() {
    if (!window.isEdit) {
        addItem();
        return;
    }

    $("#byr_id").trigger("change");
    setTimeout(() => {
        window.existingItems.forEach((item) => {
            addItem();
            const $row = $(".item-group").last();
            $row.find('[name$="[item_id]"]')
                .val(item.item_id)
                .trigger("change");
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
            $row.find('[name$="[sroScheduleNo]"]').val(item.sro_schedule_no);
            $row.find('[name$="[sroItemSerialNo]"]').val(
                item.sro_item_serial_no
            );
        });
    }, 0);
}

// function toggleInvoiceRef() {
//     const type = document.getElementById("invoiceType").value;
//     const refWrapper = document.getElementById("invoiceRefWrapper");

//     if (type === "Debit Note") {
//         refWrapper.classList.remove("d-none");
//     } else {
//         refWrapper.classList.add("d-none");
//         document.getElementById("invoiceRefNo").value = ""; // Optional: clear value
//     }
// }

document.addEventListener("click", function (e) {
    if (e.target.closest("#logout-link")) {
        e.preventDefault();
        const logoutForm = document.getElementById("logout-form");
        if (logoutForm) logoutForm.submit();
    }
});

let itemIndex = 0;
