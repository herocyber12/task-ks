<?php

namespace App\Repository;
use App\Interfaces\TransaksiInterface;
use App\Models\Keranjang;
use App\Models\Profil;
use App\Models\Produk;
use App\Models\Transaksi;
use App\Models\TransaksiFinal;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
class TransaksiRepository implements TransaksiInterface{
    public function masuk_keranjang($id)
    {
        $profil = Profil::where('user_id',Auth::user()->id)->first();

        $insert = Keranjang::create([
            'produk_id' => $id,
            'profil_id' => $profil->id,
            'status' => 'Belum Checkout',
        ]);

        if($insert){
            $stats = 'success';
            $msg = 'Berhasil Menambahkan Produk Ke Keranjang';
        } else {
            $stats = 'error';
            $msg = 'Gagal Menambahkan Produk Ke Keranjang';

        }

        return redirect()->back()->with($stats,$msg);
    }

    public function beli_sekarang($id)
    {
        $profil = Profil::where('user_id',Auth::user()->id)->first();
        $produk = Produk::where('id',$id)->first();
        DB::beginTransaction();
        try {
            $keranjang = Keranjang::create([
                'produk_id' => $produk->id,
                'profil_id' => $profil->id,
                'status' => 'Sudah Checkout',
            ]); 

            $transaksi = Transaksi::create([
                'profil_id' => $profil->id,
                'total_transaksi' => $produk->harga
            ]);

            TransaksiFinal::create([
                'transaksi_id' => $transaksi->id,
                'keranjang_id' => $keranjang->id,
                'status_pembayaran' => 'Belum Lunas',
            ]);

            DB::commit();
            $stats = 'success';
            $msg = 'Berhasil Melakukan Pemesanan';
        } catch (\Throwable $th) {
            DB::rollback();
            $stats = 'error';
            $msg = $th->getMessage();
        }

        return redirect()->back()->with($stats,$msg);
    }

    public function checkout()
    {
        DB::beginTransaction();

        try {
            $profil = Profil::where('user_id',Auth::user()->id)->first();
            $keranjang = Keranjang::where('profil_id',$profil->id)->where('status','Belum Checkout')->get();
            
            $hargaArray = $keranjang->pluck('produk.harga')->toArray();
            $total = array_sum($hargaArray);
            
            $insert = Transaksi::create([
                'profil_id' => $profil->id,
                'total_transaksi' => $total,
            ]);
            foreach($keranjang as $item)
            {
                TransaksiFinal::create([
                    'transaksi_id' => $insert->id,
                    'keranjang_id' => $item->id,
                    'status_pembayaran' => 'Belum Lunas'
                ]);
            }
    
            foreach ($keranjang as $item) {
                Keranjang::where('id', $item->id)->update([
                    'status' => 'Sudah Checkout'
                ]);
            }
            DB::commit();
            $stats = 'success';
            $msg = 'Berhasil Melakukan Checkout';
        } catch (\Throwable $th) {
            DB::rollback();
            $stats = 'error';
            $msg = $th->getMessage();
        }

        return redirect()->back()->with($stats,$msg);
    }
}