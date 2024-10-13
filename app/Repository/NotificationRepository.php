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

        $order_id = $callbacknotif->getNotification()->order_id;
        $transaksi = TransaksiFinal::with('keranjang.produk')->where('order_id',$order_id)->get();

        if($callbacknotif->isSuccess()){
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
                    'is_active' => $stokFinal === 0 ? 0 : 1,
                ];
                // if($stokFinal < 0){
                //     $data['is_active'] = 0;
                // }

                $update = Produk::where('id', $item['id'])->update($data);
            }
        }

        if($callbacknotif->isPending())
        {
            foreach($transaksi as $trx){
                $trx->status_pembayaran = 'Pending';
                $trx->save();
            }
        }

        if($callbacknotif->isExpire())
        {
            foreach($transaksi as $trx){
                $trx->status_pembayaran = 'Transaksi Kadaluarsa';
                $trx->save();
            }
        }
        
        if($callbacknotif->isCancelled())
        {
            foreach($transaksi as $trx){
                $trx->status_pembayaran = 'Transaksi Dibatalkan';
                $trx->save();
            }
            
        }
        
        return response()->json([
            'stats' => true,
            'message' => 'Berhasil di proses'
        ]);
    }
}