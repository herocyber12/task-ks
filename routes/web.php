<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\Pages\HomeController;

Route::controller(AuthController::class)->group(function(){
    Route::get('/login','index');
    Route::get('/registrasi','buat_akun');
    Route::get('/logout','logout');
    Route::post('/login', 'login')->name('login');
    Route::post('/register', 'register')->name('registrasi');
});

Route::controller(HomeController::class)->group(function(){
    Route::get('/','index')->name('landing');
    Route::get('/produk/{id}','detail')->name('detail');
    Route::get('/kategori/{id}','index')->name('kategori');
});


// Route::get('/', function () {
//     return view('pages.auth.login');
// });
