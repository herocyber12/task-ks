<?php

namespace App\Repository;

use App\Interfaces\ProfilInterface;
use Illuminate\Support\Facades\Auth;
use App\Models\Profil;
use App\Models\User;
use App\Models\TransaksiFinal;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\ProfilRequest;

class ProfilRepository implements ProfilInterface{
    public function riwayat()
    {
        $profil = Profil::where('user_id', Auth::user()->id)->first();

        if (!$profil) {
            return redirect()->back()->with('error','Profil tidak ditemukan');
        }

        $data = TransaksiFinal::with(['keranjang.produk.kategori', 'transaksi'])
            ->whereHas('transaksi', function($query) use ($profil) {
                $query->where('profil_id', $profil->id);
            })->orderBy('snap_token')->get();
        return view('pages.riwayat',compact('data'));
    }

    public function update(ProfilRequest $request)
    {
        $user = Profil::where('user_id',Auth::user()->id)->first();
        $user->name = $request->name;
        $user->alamat = $request->alamat;
        $user->no_hp = $request->no_hp;

        User::where('id',Auth::user()->id)->update([
            'email' => $request->email
        ]);
        if ($request->hasFile('foto_profil')) {
            if (Storage::exists('public/' . $user->foto_profil)) {
                // dd(Storage::delete('public/' . $user->foto_profil));
                Storage::delete('public/' . $user->foto_profil);
            }

            $path = $request->file('foto_profil')->store('profile_photos', 'public');
            $user->foto_profil = $path;
        }

        $user->save();

        return redirect()->back()->with('success', 'Profil berhasil diubah.');
    }
}