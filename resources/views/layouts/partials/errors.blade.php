@if(session('message') || $errors->has('toast_error'))
<script>
document.addEventListener("DOMContentLoaded", function () {
    let toastText = @json(session('message') ?? $errors->first('toast_error'));
    let isError = {{ $errors->has('toast_error') ? 'true' : 'false' }};

    Toastify({
        text: (isError ? "❌ " : "✅ ") + toastText,
        duration: 3000,
        gravity: "top",
        position: "right",
        close: true,
        style: {
            background: isError ? "#dc3545" : "#28a745",
        }
    }).showToast();
});
</script>
@endif
