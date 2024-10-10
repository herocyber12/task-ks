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
        $keranjang = Keranjang::with('produk')->where('profil_id', $user->id)->where('status', 'Belum Checkout')->get();
        $jumlah_data = $keranjang->count();
        
        $hargaArray = $keranjang->pluck('produk.harga')->toArray();
        $total = array_sum($hargaArray);

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