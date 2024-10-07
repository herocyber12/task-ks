<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Keranjang extends Model
{
    use HasFactory;
    protected $table = 'keranjangs';
    protected $guarded = [];

    public function produk()
    {
        return $this->belongsTo(Produk::class,'produk_id');
    }

    public function profil()
    {
        return $this->belongsTo(Profil::class,'profil_id');
    }

    public function transaksi_final()
    {
        return $this->hasMany(TransaksiFinal::class,'transaksi_id');
    }
}
