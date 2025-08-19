document.addEventListener("DOMContentLoaded", function () {
    initDeleteConfirmation();
    initTooltips();
    initToastMessage();
    initPasswordToggle();
});
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
function initTooltips() {
    const tooltipTriggerList = [].slice.call(
        document.querySelectorAll('[data-bs-toggle="tooltip"]')
    );
    tooltipTriggerList.forEach((el) => new bootstrap.Tooltip(el));
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

document.addEventListener("click", function (e) {
    if (e.target.closest("#logout-link")) {
        e.preventDefault();
        const logoutForm = document.getElementById("logout-form");
        if (logoutForm) logoutForm.submit();
    }
});


