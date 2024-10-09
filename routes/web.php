<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\Pages\HomeController;
use App\Http\Controllers\Pages\TransaksiController;

Route::controller(AuthController::class)->group(function(){
    Route::get('/login','index');
    Route::get('/registrasi','buat_akun');
    Route::get('/logout','logout');
    Route::post('/login', 'login')->name('login');
    Route::post('/register', 'register')->name('registrasi');
});

Route::controller(HomeController::class)->group(function(){
    Route::get('/','index')->name('landing');
    Route::get('/keranjang','keranjang')->name('keranjang');
    Route::get('/produk/{id}','detail')->name('detail');
    Route::get('/kategori/{id}','index')->name('kategori');
});

Route::middleware('auth')->group(function () {
    Route::controller(TransaksiController::class)->group(function(){
        Route::get('transaksi/keranjang/{id}','store_keranjang')->name('store.keranjang');
        Route::get('transaksi/{id}','store_beli_langsung')->name('store.langsung');
        Route::post('transaksi/checkout','checkouts')->name('store.checkouts');
    });
});


// Route::get('/', function () {
//     return view('pages.auth.login');
// });
