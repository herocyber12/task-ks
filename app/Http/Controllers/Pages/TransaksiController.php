<?php

namespace App\Http\Controllers\Pages;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Interfaces\TransaksiInterface;
use App\Http\Requests\TransaksiRequest;
use App\Models\Produk;
use App\Models\Keranjang;
use App\Models\Profil;
use Illuminate\Support\Facades\Auth;
class TransaksiController extends Controller
{
    protected $transaksiInterface;
    public function __construct(TransaksiInterface $transaksiInterface)
    {
        $this->transaksiInterface = $transaksiInterface;
    }

    public function store_keranjang(TransaksiRequest $req,$id)
    {
        return $this->transaksiInterface->masuk_keranjang($req,$id);
    }

    public function store_beli_langsung($id,TransaksiRequest $req)
    {
        return $this->transaksiInterface->beli_sekarang($id,$req);
    }

    public function checkouts()
    {
        return $this->transaksiInterface->checkout();
    }

    public function detail_pesanan()
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

        return view('pages.detail_pesanan', compact('keranjang','total'));
    }
}
