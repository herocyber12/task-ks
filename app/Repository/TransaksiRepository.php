<?php

namespace App\Repository;
use App\Interfaces\TransaksiInterface;
use App\Models\Keranjang;
use App\Models\Profil;
use App\Models\Produk;
use App\Models\Transaksi;
use App\Models\TransaksiFinal;
use App\Http\Requests\TransaksiRequest;
use App\Services\Midtrans\CreateSnapToken;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
class TransaksiRepository implements TransaksiInterface{

    public function masuk_keranjang(TransaksiRequest $req,$id)
    {
        $profil = Profil::where('user_id',Auth::user()->id)->first();

        $insert = Keranjang::create([
            'produk_id' => $id,
            'profil_id' => $profil->id,
            'status' => 'Belum Checkout',
            'quantity' => $req->quantity
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

    public function beli_sekarang($id,TransaksiRequest $req)
    {
        $profil = Profil::where('user_id',Auth::user()->id)->first();
        $produk = Produk::where('id',$id)->first();
        $uniqid = uniqid();

        $param = [
            'transaction_details' => [
                'order_id' => $uniqid,
                'gross_amount' => $produk->harga
            ],
            'credit_card' => [
                'secure' => true,
            ],
            'item_details' => [
                [
                    'id' => $produk->id,
                    'price' => $produk->harga,
                    'quantity' => $req->quantity,
                    'name' => $produk->nama_produk,
                ]
            ],
            'customer_details' => [
                'first_name' => $profil->name,
                'email' => Auth::user()->email,
                'phone' => $profil->no_hp ?? '08xxxxxxxxxxxx',
            ]
        ];

        $midtrans = new CreateSnapToken;
        $snapToken = $midtrans->createSnapToken($param);

        DB::beginTransaction();
        try {
            $keranjang = Keranjang::create([
                'produk_id' => $produk->id,
                'profil_id' => $profil->id,
                'status' => 'Sudah Checkout',
                'quantity' => $req->quantity,
            ]); 
            
            $transaksi = Transaksi::create([ 
                'profil_id' => $profil->id,
                'total_transaksi' => $produk->harga
            ]);

            TransaksiFinal::create([
                'order_id' => $uniqid,
                'transaksi_id' => $transaksi->id,
                'keranjang_id' => $keranjang->id,
                'status_pembayaran' => 'Belum Lunas',
                'snap_token' => $snapToken,
            ]);

            DB::commit();
            $stats = 'snaptoken';
            $msg = $snapToken;
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
            $keranjang = Keranjang::with('produk')->where('profil_id',$profil->id)->where('status','Belum Checkout')->get();
            
            $hargaArray = $keranjang->pluck('produk.harga')->toArray();
            $total = array_sum($hargaArray);
            
            $insert = Transaksi::create([
                'profil_id' => $profil->id,
                'total_transaksi' => $total,
            ]);
            
            $item_detail = [];

            foreach ($keranjang as $item) {
                $item_detail[] = [
                    'id' => $item->produk->id,
                    'price' => $item->produk->harga,
                    'quantity' => $item->quantity,
                    'name' => $item->produk->nama_produk,
                ];
            }

            $uniqid = uniqid();

            $param = [
                'transaction_details' => [
                    'order_id' => $uniqid,
                    'gross_amount' => $total
                ],
                'credit_card' => [
                    'secure' => true,
                ],
                'item_details' => $item_detail,
                'customer_details' => [
                    'first_name' => $profil->name,
                    'email' => Auth::user()->email,
                    'phone' => $profil->no_hp ?? '08xxxxxxxxxxxx',
                ]
            ];
    
            $midtrans = new CreateSnapToken;
            $snapToken = $midtrans->createSnapToken($param);

            foreach($keranjang as $item)
            {

                TransaksiFinal::create([
                    'order_id' => $uniqid,
                    'transaksi_id' => $insert->id,
                    'keranjang_id' => $item->id,
                    'status_pembayaran' => 'Belum Lunas',
                    'snap_token' => $snapToken
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

        Session::flash('snaptoken', $snapToken);
        return redirect()->back()->with($stats,$msg);
    }
}