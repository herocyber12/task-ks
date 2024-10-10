<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\Pages\HomeController;
use App\Http\Controllers\Pages\TransaksiController;
use App\Http\Controllers\NotifSys\NotificationController;
use App\Http\Controllers\PaymentController;

Route::post('/midtrans/notifikasi',[NotificationController::class,'receive']);
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
    Route::get('hapus-pesanan/{id}',[HomeController::class,'delete_keranjang'])->name('delete.item-keranjang');
    Route::controller(TransaksiController::class)->group(function(){
        Route::post('transaksi/keranjang/{id}','store_keranjang')->name('store.keranjang');
        Route::post('transaksi/{id}','store_beli_langsung')->name('store.langsung');
        Route::get('detail-pesanan','detail_pesanan')->name('detail.pesanan');
        Route::get('transaksi/checkout','checkouts')->name('store.checkouts');
    });
});
