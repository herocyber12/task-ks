<?php

namespace App\Http\Controllers\Pages;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Interfaces\ProfilInterface;
use App\Models\Profil;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\ProfilRequest;

class ProfilController extends Controller
{
    protected $profilInterface;
    public function __construct(ProfilInterface $profilInterface)
    {
        $this->profilInterface = $profilInterface;
    }

    public function index()
    {
        $profil = Profil::where('user_id', Auth::user()->id)->first();
        return view('pages.profil', compact('profil'));
    }

    public function riwayat()
    {
        return $this->profilInterface->riwayat();
    }
    
    public function update(ProfilRequest $request)
    {
        return $this->profilInterface->update($request);
    }
}
