<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\AuthController;

Route::controller(AuthController::class)->group(function(){
    Route::get('/login','index');
    Route::get('/registrasi','buat_akun');
    Route::get('/logout','logout');
    Route::post('/login', 'login')->name('login');
    Route::post('/register', 'register')->name('registrasi');
});

Route::get('/', function () {
    return view('pages.auth.login');
});
