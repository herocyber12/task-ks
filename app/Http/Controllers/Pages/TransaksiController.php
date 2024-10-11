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
use App\Services\GetKeranjang;

class TransaksiController extends Controller
{
    protected $transaksiInterface;
    protected $keranjangServices;
    public function __construct(TransaksiInterface $transaksiInterface, GetKeranjang $keranjangServices)
    {
        $this->transaksiInterface = $transaksiInterface;
        $this->services = $keranjangServices;
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
        $keranjangData = $this->services->getKeranjang();
        
        $keranjang = $keranjangData['keranjang'];
        $total = $keranjangData['total'];
        return view('pages.detail_pesanan', compact('keranjang','total'));
    }
}
