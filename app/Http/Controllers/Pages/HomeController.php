<?php

namespace App\Http\Controllers\Pages;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Produk;
use App\Models\Kategori;

class HomeController extends Controller
{
    public function index()
    {
        $data = Produk::paginate(16);
        $kategori = Kategori::all();
        return view('pages.index',compact('data','kategori'));
    }

    public function detail($id)
    {
        $produk = new Produk;
        $data = $produk->with('kategori')->where('id',$id)->first();
        $another = $produk->inRandomOrder()->take(30)->get();
        // dd($another);
        return view('pages.detail',compact('data','another'));
    }
}
