<?php

namespace App\Interfaces;
use App\Http\Requests\AuthRequest;
interface AuthInterface {
    public function login(AuthRequest $req);
    public function register(AuthRequest $req);
    public function logout();
}