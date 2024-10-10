<?php

namespace App\Interfaces;

use App\Http\Requests\TransaksiRequest;

interface TransaksiInterface {
   public function masuk_keranjang(TransaksiRequest $req,$id);
   public function beli_sekarang($id,TransaksiRequest $req); 
   public function checkout(); 
}