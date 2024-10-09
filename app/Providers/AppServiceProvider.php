<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Pagination\Paginator;
use App\Interfaces\AuthInterface;
use App\Repository\AuthRepository;
use App\Interfaces\TransaksiInterface;
use App\Repository\TransaksiRepository;
use App\Interfaces\HomeInterface;
use App\Repository\HomeRepository;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $this->app->bind(
            AuthInterface::class,
            AuthRepository::class    
        );

        $this->app->bind(
            TransaksiInterface::class,
            TransaksiRepository::class,
        );

        $this->app->bind(
            HomeInterface::class,
            HomeRepository::class,
        );
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Paginator::useBootstrapFive();
    }
}
