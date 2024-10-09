<?php

namespace App\Http\Controllers\Pages;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Interfaces\TransaksiInterface;
class TransaksiController extends Controller
{
    protected $transaksiInterface;
    public function __construct(TransaksiInterface $transaksiInterface)
    {
        $this->transaksiInterface = $transaksiInterface;
    }

    public function store_keranjang($id)
    {
        return $this->transaksiInterface->masuk_keranjang($id);
    }

    public function store_beli_langsung($id)
    {
        return $this->transaksiInterface->beli_sekarang($id);
    }

    public function checkouts()
    {
        return $this->transaksiInterface->checkout();
    }
}
