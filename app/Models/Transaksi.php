<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaksi extends Model
{
    use HasFactory;
    protected $table = 'transaksis';
    protected $guarded = [];

    public function profil()
    {
        return $this->belongsTo(Profil::class,'profil_id');
    }

    public function transaksi_final()
    {
        return $this->hasMany(TransaksiFinal::class,'transaksi_id');
    }
}
