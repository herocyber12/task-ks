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
        Schema::create('produks', function (Blueprint $table) {
            $table->id();
            $table->string('nama_produk');
            $table->unsignedBigInteger('kategori_id')->nullable();
            $table->integer('harga');
            $table->text('deskripsi');
            $table->integer('stok');
            $table->boolean('is_active')->default(true);
            $table->string('foto_produk');
            $table->timestamps();
            $table->softDeletes();
            $table->foreign('kategori_id')->references('id')->on('kategoris')->onUpdate('NO ACTION')->onDelete('SET NULL');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('produks');
    }
};
