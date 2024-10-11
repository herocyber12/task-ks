<?php

namespace App\Repository;
use App\Interfaces\HomeInterface;

use App\Models\Keranjang;
use App\Models\Profil;
use Illuminate\Support\Facades\Auth;

class HomeRepository implements HomeInterface{

    public function get_keranjang()
    {

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

        return response()->json([
            'keranjang' => $keranjang->toArray(),
            'total' => number_format($total, '0', '.', '.'),
            'jumlh_data' => $jumlah_data,
            'transak' => $transak,
        ]);
    }

    public function delete_item_keranjang($id)
    {
        $delete = Keranjang::where('id',$id)->delete();
        if ($delete)
        {
            $stats = 'success';
            $msg = 'Berhasil menghapus item dari keranjang';
        } else {
            $stats = 'error';
            $msg = 'Gagal menghapus item dari keranjang';
        }
        return redirect()->back()->with($stats,$msg);

    }

}