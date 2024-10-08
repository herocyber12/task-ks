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

Route::get('/',[HomeController::class,'index'])->name('landing');
Route::get('/produk/{id}',[HomeController::class,'detail'])->name('detail');
// Route::get('/', function () {
//     return view('pages.auth.login');
// });
