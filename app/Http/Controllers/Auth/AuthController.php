<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Interfaces\AuthInterface;
use App\Http\Requests\AuthRequest;
class AuthController extends Controller
{
    protected $authInterface;
    public function __construct(AuthInterface $authInterface)
    {
        $this->authInterface = $authInterface;
    }

    public function index()
    {
        return view('pages.auth.login');
    }

    public function buat_akun()
    {
        return view('pages.auth.registrasi');
    }

    public function login(AuthRequest $req)
    {
        return $this->authInterface->login($req);
    }

    public function register(AuthRequest $req)
    {
        return $this->authInterface->register($req);
    }

    public function logout()
    {
        return $this->authInterface->logout();
    }
}
