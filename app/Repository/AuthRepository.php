<?php

namespace App\Repository;

use App\Interfaces\AuthInterface;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Profil;
use App\Http\Requests\AuthRequest;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;

class AuthRepository implements AuthInterface 
{
    public function login(AuthRequest $req)
    {
        $credential = $req->only('email','password');
        if(Auth::attempt($credential))
        {
            return redirect()->route('landing');
        } else {
            return redirect()->to('login');
        }
    }

    public function register(AuthRequest $req)
    {
        DB::beginTransaction();
        
        try {
            $insert = User::create([
                'email' => $req->email,
                'password' => Hash::make($req->password),
                'role' => 'Customer'
            ]);
    
            Profil::create([
                'name' => $req->name,
                'user_id' => $insert->id
            ]);
            DB::commit();
            $route = 'login';
            $stats = 'success';
            $message = 'Verhasil membuat akun';
        } catch (\Throwable $th) {
            DB::rollBack();
            $route = 'registrasi';
            $stats = 'error';
            $message = $th->getMessage();   
        }

        return redirect()->to($route)->with($stats,$message);
    }

    public function logout()
    {
        Auth::logout();
        return view('pages.index');
    }
}