@if(session('message') || $errors->has('toast_error'))
<div id="toast-data" data-toast-message="{{ session('message') ?? $errors->first('toast_error') }}"
    data-toast-error="{{ $errors->has('toast_error') ? 'true' : 'false' }}">
</div>
@endif