<?php

namespace App\Http\Controllers\NotifSys;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Interfaces\NotificationInterface;

class NotificationController extends Controller
{
    protected $notifInterface;

    public function __construct(NotificationInterface $notifInterface)
    {
        $this->notifInterface = $notifInterface;
    }
    public function receive(Request $req)
    {
        return $this->notifInterface->receives($req);
    }
}
