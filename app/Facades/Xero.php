<?php

namespace App\Facades;

use Illuminate\Support\Facades\Facade;

class Xero extends Facade
{
    protected static function getFacadeAccessor()
    {
        return 'xero';
    }
}