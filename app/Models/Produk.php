<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Produk extends Model
{
    use HasFactory,SoftDeletes;
    protected $table = 'produks';
    protected $guarded = [];

    public function kategori()
    {
        return $this->belongsTo(Kategori::class,'kategori_id');
    }

    public function keranjang()
    {
        return $this->hasMany(Keranjang::class,'produk_id');
    }
}
