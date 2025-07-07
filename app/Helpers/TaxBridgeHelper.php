<?php

use Carbon\Carbon;

if (!function_exists('logError')) {
    function logError(array $context = [])
    {
        $message = "";
        if (isset($context['exception']) && $context['exception'] instanceof \Exception) {
            $exception = $context['exception'];
            $message .= ' | Exception: ' . $exception->getMessage();
            $message .= ' | File: ' . $exception->getFile();
            $message .= ' | Line: ' . $exception->getLine();
            unset($context['exception']);
        }
        Log::channel('grclogs')->error($message, $context);
        Log::channel('slack')->error($message, $context);
    }
}