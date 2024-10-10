<?php

namespace App\Interfaces;
use Illuminate\Http\Request;

interface NotificationInterface
{
    public function receives(Request $req);
}
