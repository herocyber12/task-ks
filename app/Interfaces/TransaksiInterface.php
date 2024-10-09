<?php

namespace App\Interfaces;

interface TransaksiInterface {
   public function masuk_keranjang($id);
   public function beli_sekarang($id); 
   public function checkout(); 
}