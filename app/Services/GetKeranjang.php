<?php 

namespace App\Services;

use App\Models\Keranjang;
use App\Models\Profil;
use Illuminate\Support\Facades\Auth;

class GetKeranjang {
    public function getKeranjang(){
        $user = Profil::where('user_id', Auth::user()->id)->first();
        $keranjang = Keranjang::with('produk')->where('profil_id', $user->id)->whereHas('produk',function ($query){
            $query->where('deleted_at',NULL);
        })->where('status', 'Belum Checkout')->get();
        
        $hargaArray = $keranjang->pluck('produk.harga')->toArray();
        $quantityArray = $keranjang->pluck('quantity')->toArray();

        $totalHargaPerItem = array_map(function($harga, $quantity) {
            return $harga * $quantity;
        }, $hargaArray, $quantityArray);

        $total = array_sum($totalHargaPerItem);
        
        $jumlah_data = $keranjang->count();
        $transak = $jumlah_data > 0;

        return [
            'keranjang' => $keranjang,
            'total' => $total,
            'jumlah_data' => $jumlah_data,
            'transak' => $transak,
        ];
    }
}