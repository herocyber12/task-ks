<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TransaksiFinal extends Model
{
    use HasFactory;
    protected $table = 'transaksi_finals';
    protected $guarded = [];

    public function transaksi()
    {
        return $this->belongsTo(Transaksi::class,'transaksi_id');
    }
    public function keranjang()
    {
        return $this->belongsTo(Keranjang::class,'keranjang_id');
    }
}
