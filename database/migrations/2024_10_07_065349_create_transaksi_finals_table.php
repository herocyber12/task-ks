<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('transaksi_finals', function (Blueprint $table) {
            $table->id();
            $table->string('order_id');
            $table->unsignedBigInteger('transaksi_id');
            $table->unsignedBigInteger('keranjang_id');
            $table->enum('status_pembayaran',['Belum Lunas','Lunas','Pending','Transaksi Kadaluarsa','Transaksi Dibatalkan']);
            $table->string('snap_token');
            $table->timestamps();

            $table->foreign('transaksi_id')->references('id')->on('transaksis');
            $table->foreign('keranjang_id')->references('id')->on('keranjangs');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('transaksi_finals');
    }
};
