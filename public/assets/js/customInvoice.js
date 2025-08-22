// Immediately block buyer auto fetch if form was just submitted
if (sessionStorage.getItem("justSubmittedForm") === "1") {
    console.log("⛔ Blocked buyer fetch before anything loads");
    sessionStorage.removeItem("justSubmittedForm");
    window.skipBuyerFetch = true; // ✅ use this later
}

/* ----------------- Scenario Handling ----------------- */
function updateSaleType(targetSelect) {
    const selectedOption = targetSelect.options[targetSelect.selectedIndex];
    const saleType = selectedOption.getAttribute("data-sale-type");

    // update ALL saleTypeInput fields in all rows
    $(".saleTypeInput").val(saleType ? saleType : "");
}

function initScenarioHandler() {
    const scenarioSelect = document.getElementById("scenarioId");
    if (!scenarioSelect) return;

    // On change
    scenarioSelect.addEventListener("change", function () {
        updateSaleType(this);
    });

    // On page load (edit mode)
    updateSaleType(scenarioSelect);
}

let lastClickedSubmitButton = null;
document.addEventListener("DOMContentLoaded", function () {
    initBuyerChangeHandler();
    initItemHandlers();
    initInvoiceStatusButtons();
    initEditInvoiceItems();
    initFormBehavior();
    initBuyerChangeDispatchIfNeeded(); // <-- add this here
    // 👇 add scenario logic here
    initScenarioHandler();
});

function initBuyerChangeHandler() {
    const buyerSelect = document.getElementById("byr_id");
    const loader = document.getElementById("buyerLoader");
    if (!buyerSelect) return;

    buyerSelect.addEventListener("change", function () {
        if (window.formIsSubmitting || window.skipBuyerFetch) {
            console.log("⛔ Blocked buyer fetch during submit or after reload");
            return;
        }

        const id = this.value;
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

        if (loader) loader.classList.remove("d-none");

        // fetch(`/buyers/fetch/${id}`)
        //     .then((res) => res.json())
        //     .then((b) => {
        //         if (!b) return;
        //         document.querySelector("[name=buyerNTNCNIC]").value =
        //             b.byr_ntn_cnic || "";
        //         document.querySelector("[name=buyerAddress]").value =
        //             b.byr_address || "";
        //         document.querySelector("[name=buyerProvince]").value =
        //             b.byr_province || "";
        //         document.querySelector("[name=buyerRegistrationType]").value =
        //             b.byr_type == 1 ? "Registered" : "Unregistered";
        //     })
        //     .catch(() => alert("Failed to fetch buyer details."))
        //     .finally(() => loader?.classList.add("d-none"));

        $.ajax({
            url: `/buyers/fetch/${id}`,
            method: "GET",
            dataType: "json",
            success: function (b) {
                if (!b) return;
                $("[name=buyerNTNCNIC]").val(b.byr_ntn_cnic || "");
                $("[name=buyerAddress]").val(b.byr_address || "");
                $("[name=buyerProvince]").val(b.byr_province || "");
                $("[name=buyerRegistrationType]").val(
                    b.byr_type == 1 ? "Registered" : "Unregistered"
                );
            },
            error: function () {
                alert("Failed to fetch buyer details.");
            },
            complete: function () {
                if (loader) loader.classList.add("d-none");
            },
        });
    });
}

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
        // $row.find('[name$="[SalesTaxApplicable]"]').val(opt.data("tax") || "");

        calculateRow($row);
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
    // $("#itemsContainer").on(
    //     "input",
    //     '[name$="[furtherTax]"], [name$="[extraTax]"], [name$="[fedPayable]"] , [name$="[discount]"]',
    //     updateTaxTotalsFromItems
    // );
    // Safety parser
    function parseFloatSafe(v) {
        const n = parseFloat((v ?? "").toString().replace(/,/g, ""));
        return isNaN(n) ? 0 : n;
    }

    // Recalculate ONE row (called when % or base changes)
    function updateLineItemRow($row) {
        const base = parseFloatSafe(
            $row.find('[name$="[valueSalesExcludingST]"]').val()
        );

        // Helper: update from % unless user manually typed a value
        function maybeFromPercent(pctSelector, valSelector) {
            const $pct = $row.find(pctSelector);
            const $val = $row.find(valSelector);

            const pct = parseFloatSafe($pct.val());
            const manual = $val.data("manual") === true; // user typed value

            if (pct > 0 && !manual) {
                const computed = (base * pct) / 100;
                $val.val(computed.toFixed(2));
                $val.data("auto", true);
            }
        }

        // Further Tax
        maybeFromPercent(
            '[name$="[furtherTax_percentage]"]',
            '[name$="[furtherTax]"]'
        );

        // Extra Tax
        maybeFromPercent(
            '[name$="[extraTax_percentage]"]',
            '[name$="[extraTax]"]'
        );

        // FED Payable
        maybeFromPercent(
            '[name$="[fedPayable_percentage]"]',
            '[name$="[fedPayable]"]'
        );
    }

    // Sum all rows into footer totals
    function updateTaxTotalsFromItems() {
        let totalfurtherTax = 0,
            totalextraTax = 0,
            totalFedTax = 0,
            totalDiscount = 0;

        $(".item-group").each(function () {
            totalfurtherTax += parseFloatSafe(
                $(this).find('[name$="[furtherTax]"]').val()
            );
            totalextraTax += parseFloatSafe(
                $(this).find('[name$="[extraTax]"]').val()
            );
            totalFedTax += parseFloatSafe(
                $(this).find('[name$="[fedPayable]"]').val()
            );
            totalDiscount += parseFloatSafe(
                $(this).find('[name$="[discount]"]').val()
            );
        });

        $("#totalfurtherTax").val(totalfurtherTax.toFixed(2));
        $("#totalextraTax").val(totalextraTax.toFixed(2));
        $("#totalFedTax").val(totalFedTax.toFixed(2));
        $("#totalDiscount").val(totalDiscount.toFixed(2));
    }

    /* ------------------ Event delegation ------------------ */
    const container = $("#itemsContainer");

    // When % fields OR base changes → recalc that specific row, then totals
    container.on(
        "input change",
        '[name$="[furtherTax_percentage]"], [name$="[extraTax_percentage]"], [name$="[fedPayable_percentage]"], [name$="[valueSalesExcludingST]"]',
        function () {
            const $row = $(this).closest(".item-group");
            updateLineItemRow($row);
            updateTaxTotalsFromItems();
        }
    );

    // When user types direct values → mark as manual and just update totals
    container.on(
        "input",
        '[name$="[furtherTax]"], [name$="[extraTax]"], [name$="[fedPayable]"], [name$="[discount]"]',
        function () {
            // user is overriding; don't auto-recompute this field from %
            $(this).data("manual", true);
            updateTaxTotalsFromItems();
        }
    );

    // If user clears a value field, allow auto again on next %/base change
    container.on(
        "change blur",
        '[name$="[furtherTax]"], [name$="[extraTax]"], [name$="[fedPayable]"]',
        function () {
            if (!$(this).val()) {
                $(this).data("manual", false);
            }
        }
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
    // ✅ update all saleType inputs for new row also
    const scenarioSelect = document.getElementById("scenarioId");
    if (scenarioSelect) updateSaleType(scenarioSelect);
}

function updateSubmitButton() {
    $("#submitBtn").toggle($(".item-group").length > 0);
}

function calculateRow($row) {
    const qty = parseFloatSafe($row.find('[name$="[quantity]"]').val());
    const price = parseFloatSafe($row.find('[name$="[item_price]"]').val());
    const taxRate = parseFloatSafe($row.find('[name$="[rate]"]').val());

    const taxAmount = qty * price * (taxRate / 100);
    const excl = qty * price;
    const incl = excl + taxAmount;

    $row.find('[name$="[valueSalesExcludingST]"]').val(excl.toFixed(2));
    $row.find('[name$="[totalValues]"]').val(incl.toFixed(2));
    $row.find('[name$="[calculatedTax]"]').val(taxAmount.toFixed(2));
    $row.find('[name$="[SalesTaxApplicable]"]').val(taxAmount.toFixed(2));
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

// function updateTaxTotalsFromItems() {
//     let totalfurtherTax = 0,
//         totalextraTax = 0,
//         totalFedTax = 0,
//         totalDiscount = 0;
//     $(".item-group").each(function () {
//         totalfurtherTax += parseFloatSafe(
//             $(this).find('[name$="[furtherTax]"]').val()
//         );
//         totalextraTax += parseFloatSafe(
//             $(this).find('[name$="[extraTax]"]').val()
//         );
//         totalFedTax += parseFloatSafe(
//             $(this).find('[name$="[fedPayable]"]').val()
//         );
//         totalDiscount += parseFloatSafe(
//             $(this).find('[name$="[discount]"]').val()
//         );
//     });
//     $("#totalfurtherTax").val(totalfurtherTax.toFixed(2));
//     $("#totalextraTax").val(totalextraTax.toFixed(2));
//     $("#totalFedTax").val(totalFedTax.toFixed(2));
//     $("#totalDiscount").val(totalDiscount.toFixed(2));
// }

function updateTaxTotalsFromItems() {
    let totalfurtherTax = 0,
        totalextraTax = 0,
        totalFedTax = 0,
        totalDiscount = 0;

    $(".item-group").each(function () {
        let base = parseFloatSafe(
            $(this).find('[name$="[valueSalesExcludingST]"]').val()
        );

        // Further Tax
        let furtherTaxVal = parseFloatSafe(
            $(this).find('[name$="[furtherTax]"]').val()
        );
        let furtherTaxPct = parseFloatSafe(
            $(this).find('[name$="[furtherTax_percentage]"]').val()
        );
        if (furtherTaxPct > 0 && furtherTaxVal === 0) {
            furtherTaxVal = (base * furtherTaxPct) / 100;
            $(this)
                .find('[name$="[furtherTax]"]')
                .val(furtherTaxVal.toFixed(2)); // auto fill
        }
        totalfurtherTax += furtherTaxVal;

        // Extra Tax
        let extraTaxVal = parseFloatSafe(
            $(this).find('[name$="[extraTax]"]').val()
        );
        let extraTaxPct = parseFloatSafe(
            $(this).find('[name$="[extraTax_percentage]"]').val()
        );
        if (extraTaxPct > 0 && extraTaxVal === 0) {
            extraTaxVal = (base * extraTaxPct) / 100;
            $(this).find('[name$="[extraTax]"]').val(extraTaxVal.toFixed(2));
        }
        totalextraTax += extraTaxVal;

        // FED Payable
        let fedTaxVal = parseFloatSafe(
            $(this).find('[name$="[fedPayable]"]').val()
        );
        let fedTaxPct = parseFloatSafe(
            $(this).find('[name$="[fedPayable_percentage]"]').val()
        );
        if (fedTaxPct > 0 && fedTaxVal === 0) {
            fedTaxVal = (base * fedTaxPct) / 100;
            $(this).find('[name$="[fedPayable]"]').val(fedTaxVal.toFixed(2));
        }
        totalFedTax += fedTaxVal;

        // Discount (value only, no % here unless you want to extend)
        totalDiscount += parseFloatSafe(
            $(this).find('[name$="[discount]"]').val()
        );
    });

    // Totals
    $("#totalfurtherTax").val(totalfurtherTax.toFixed(2));
    $("#totalextraTax").val(totalextraTax.toFixed(2));
    $("#totalFedTax").val(totalFedTax.toFixed(2));
    $("#totalDiscount").val(totalDiscount.toFixed(2));
}

function parseFloatSafe(val) {
    return parseFloat(val) || 0;
}

function initBuyerChangeDispatchIfNeeded() {
    if (
        window.isEdit &&
        window.buyerId &&
        !window.formIsSubmitting &&
        !window.skipBuyerFetch
    ) {
        const buyerSelect = document.getElementById("byr_id");
        if (buyerSelect) {
            buyerSelect.value = window.buyerId;

            setTimeout(() => {
                console.log(
                    "✅ Dispatching buyer change (not from submission)"
                );
                buyerSelect.dispatchEvent(new Event("change"));
            }, 200);
        }
    }
}

// function initFormBehavior() {
//     const form = document.getElementById("invoiceForm");
//     const submitBtn = form?.querySelector('button[type="submit"]');
//     if (!form || !submitBtn) return;

//     form.addEventListener("keydown", function (e) {
//         if (e.key === "Enter" && e.target.tagName !== "TEXTAREA") {
//             e.preventDefault();
//         }
//     });

//     form.addEventListener("submit", function (e) {
//         // ✅ Only proceed if one of the real submit buttons was clicked
//         if (
//             lastClickedSubmitButton === "draft" ||
//             lastClickedSubmitButton === "fbr"
//         ) {
//             sessionStorage.setItem("justSubmittedForm", "1");
//             window.formIsSubmitting = true;

//             form.querySelectorAll('input[type="text"], textarea').forEach(
//                 (input) => {
//                     input.value = input.value.trim();
//                 }
//             );

//             // Disable both buttons
//             const draftBtn = document.getElementById("draftBtn");
//             const submitBtn = document.getElementById("submitBtn");
//             draftBtn.disabled = true;
//             submitBtn.disabled = true;

//             // Apply spinner to clicked button
//             if (lastClickedSubmitButton === "draft") {
//                 draftBtn.innerHTML =
//                     '<span class="spinner-border spinner-border-sm me-1"></span> Saving as Draft...';
//             } else {
//                 submitBtn.innerHTML =
//                     '<span class="spinner-border spinner-border-sm me-1"></span> Posting to FBR...';
//             }
//         } else {
//             e.preventDefault(); // block unwanted submits
//         }
//     });
// }

function initFormBehavior() {
    const form = document.getElementById("invoiceForm");
    const submitBtn = form?.querySelector('button[type="submit"]');
    if (!form || !submitBtn) return;

    // Prevent accidental submit on Enter except textarea
    form.addEventListener("keydown", function (e) {
        if (e.key === "Enter" && e.target.tagName !== "TEXTAREA") {
            e.preventDefault();
        }
    });

    form.addEventListener("submit", function (e) {
        // Allow submit ONLY if Draft or FBR button was clicked
        if (
            lastClickedSubmitButton === "draft" ||
            lastClickedSubmitButton === "fbr"
        ) {
            sessionStorage.setItem("justSubmittedForm", "1");
            window.formIsSubmitting = true;

            // Trim text/textarea values
            form.querySelectorAll('input[type="text"], textarea').forEach(
                (input) => {
                    input.value = input.value.trim();
                }
            );

            // Disable both buttons
            const draftBtn = document.getElementById("draftBtn");
            const fbrBtn = document.getElementById("submitBtn");
            draftBtn.disabled = true;
            fbrBtn.disabled = true;

            // Apply spinner to clicked button
            if (lastClickedSubmitButton === "draft") {
                draftBtn.innerHTML =
                    '<span class="spinner-border spinner-border-sm me-1"></span> Saving as Draft...';
            } else {
                fbrBtn.innerHTML =
                    '<span class="spinner-border spinner-border-sm me-1"></span> Posting to FBR...';
            }
        } else {
            e.preventDefault(); // block unwanted submits
        }
    });
}

function initInvoiceStatusButtons() {
    const draftBtn = document.getElementById("draftBtn");
    const submitBtn = document.getElementById("submitBtn");
    const invoiceStatus = document.getElementById("invoice_status");

    draftBtn?.addEventListener("click", () => {
        invoiceStatus.value = 1;
        lastClickedSubmitButton = "draft";
    });

    submitBtn?.addEventListener("click", () => {
        invoiceStatus.value = 2;
        lastClickedSubmitButton = "fbr";
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
let itemIndex = window.existingItems.length || 0;
function initEditInvoiceItems() {
    if (!window.isEdit) {
        addItem();
        return;
    }

    // Step 3: Add existing items
    setTimeout(() => {
        window.existingItems.forEach((item, index) => {
            addItem();
            const $row = $(".item-group").last();

            // Delay change for select if needed
            setTimeout(() => {
                $row.find('[name$="[item_id]"]')
                    .val(item.item_id)
                    .trigger("change");
            }, 100);

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
                item.sales_tax_withheld
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

// let itemIndex = 0;
