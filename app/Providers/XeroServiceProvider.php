<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class XeroServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register()
    {
        $this->app->bind(OauthCredentialManager::class, function ($app) {
            return new OauthCredentialManager(new FileStore(
                config('xero')
            ));
        });
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        //
    }
}