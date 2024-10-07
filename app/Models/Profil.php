<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Profil extends Model
{
    use HasFactory;
    protected $table = 'profils';
    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }

    public function keranjang()
    {
        return $this->hasMany(Keranjang::class,'profil_id');
    }

    public function transaksi()
    {
        return $this->hasMany(Transaksi::class,'profil_id');
    }
}
