<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Produk extends Model
{
    use HasFactory;
    protected $table = 'produks';
    protected $guarded = [];

    public function kategori()
    {
        return $this->belongsTo(Kategori::class,'kategori_id');
    }

    public function keranjang()
    {
        return $this->hasMany(Produk::class,'produk_id');
    }
}
