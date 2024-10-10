<?php

namespace App\Services\Midtrans;

use Midtrans\Snap;

class CreateSnapToken extends Midtrans{
    public function createSnapToken($param)
    {
        $snapToken = Snap::getSnapToken($param);
        return $snapToken;
    }
};