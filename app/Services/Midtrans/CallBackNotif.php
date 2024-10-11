<?php

namespace App\Services\Midtrans;

use App\Models\TransaksiFinal;
use Midtrans\Notification;

class CallBackNotif extends Midtrans{

    protected $notification;
    protected $serverKey;
    protected $order;

    public function __construct()
    {
        parent::__construct();
        $this->serverKey = config('midtrans.server_key');
        $this->_handleNotification();
    }

    protected function _handleNotification()
    {
        $notification = new Notification();
        $this->notification = $notification;
    }

    public function isSignatureKeyVerified()
    {
        return ($this->_createLocalSignatureKey() == $this->notification->signature_key);
    }

    public function handleSuccess()
    {
        $order_id = $this->notification->order_id;
        $transaksi = TransaksiFinal::with('keranjang.produk')->where('order_id',$order_id)->get();
        $stokUpdate = [];
        foreach($transaksi as $trx){
            $trx->status = 'Lunas';
            $trx->save();

            $stokUpdate[] = [
                'id' => $trx->keranjang->produk->id,
                'stok' => $trx->keranjang->produk->stok,
                'quantity' => $trx->keranjang->quantity
            ];
        }

        foreach ($stokUpdate as $key=>$item) {
            $stokSekarang = $item->stok - $item->quantity;
            $stokFinal = $stokSekarang < 0 ? abs($stokSekarang) : $stokSekarang;

            Produk::where('id', $item->id)->update([
                'stok' => $stokFinal
            ]);
        }
    }

    public function isSuccess()
    {
        $statusCode = $this->notification->status_code;
        $transactionStatus = $this->notification->transaction_status;
        $fraudStatus = !empty($this->notification->fraud_status) ? ($this->notification->fraud_status == 'accept') : true;

        return ($statusCode == 200 && $fraudStatus && ($transactionStatus == 'capture' || $transactionStatus == 'settlement'));
    }

    public function isExpire()
    {
        return ($this->notification->transaction_status == 'expire');
    }

    public function isCancelled()
    {
        return ($this->notification->transaction_status == 'cancel');
    }

    public function isPending()
    {
        return ($this->notification->transaction_status == 'pending');
    }

    public function getNotification()
    {
        return $this->notification;
    }
    protected function _createLocalSignatureKey()
    {
        return hash('sha512',
            $this->notification->order_id.$this->notification->status_code.
            $this->notification->gross_amount.$this->serverKey
        );
    }
}