<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
// use Webfox\Xero\OauthCredentialManager;
// use Webfox\Xero\Oauth2CredentialManagers\FileStore;
// use Webfox\Xero\XeroApp;
// use Illuminate\Console\Scheduling\Schedule;

// use App\Console\Commands\SyncXeroInvoices;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

$app = Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__ . '/../routes/web.php',
        commands: __DIR__ . '/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        //
    })
    ->withExceptions(function (Exceptions $exceptions) {
        //
    })->create();

// ✅ Correct binding: bind interface to XeroApp, not FileStore
// $app->singleton(OauthCredentialManager::class, function () {
//     return new XeroApp(new FileStore(config('xero')));
// });

// ✅ Alias for facade usage (like Xero::authorize())
// $app->alias(OauthCredentialManager::class, 'xero');

// $app->afterResolving(ConsoleKernel::class, function ($kernel) {
//     $kernel->command(SyncXeroInvoices::class)
//         ->hourly(); // or ->dailyAt('02:00')
// });

// $app->afterResolving(Schedule::class, function (Schedule $schedule) {
//     $schedule->command('xero:sync-invoices')->hourly();
// });

return $app;