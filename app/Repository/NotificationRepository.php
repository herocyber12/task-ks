<?php 

namespace App\Repository;
use App\Interfaces\NotificationInterface;
use Illuminate\Http\Request;
use App\Services\Midtrans\CallBackNotif;
use App\Models\TransaksiFinal;
use App\Models\Produk;
use Illuminate\Support\Facades\Session;


class NotificationRepository implements NotificationInterface{
    public function receives(Request $req){
        $callbacknotif = new CallBackNotif;

        if(!$callbacknotif ->isSignatureKeyVerified()){
            return response()->json(['stats' => false,'message' => 'Invalid Signature'], 403);
        }

        if($callbacknotif->isSuccess()){
            $order_id = $callbacknotif->getNotification()->order_id;
            $transaksi = TransaksiFinal::with('keranjang.produk')->where('order_id',$order_id)->get();
            $stokUpdate = [];
            
            foreach($transaksi as $trx){
                $trx->status_pembayaran = 'Lunas';
                $trx->save();

                $stokUpdate[] = [
                    'id' => $trx->keranjang->produk->id,
                    'stok' => $trx->keranjang->produk->stok,
                    'quantity' => $trx->keranjang->quantity
                ];
            }

            foreach ($stokUpdate as $item) {
                $stokSekarang = $item['stok'] - $item['quantity'];
                $stokFinal = $stokSekarang < 0 ? 0 : $stokSekarang;
                $data = [
                    'stok' => $stokFinal,
                ];
                if($stokFinal < 0){
                    $data['status_produk'] = 'Tidak Aktif';
                }

                $update = Produk::where('id', $item['id'])->update($data);
            }
        }

        Session::flash('successs',true);
        
        return response()->json([
            'stats' => true,
            'message' => 'Berhasil di proses'
        ]);
    }
}