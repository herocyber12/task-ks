<?php

namespace App\Http\Controllers\Pages;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Produk;
use App\Models\Kategori;
use App\Interfaces\HomeInterface;

class HomeController extends Controller
{
    protected $homeInterface;
    public function __construct(HomeInterface $homeInterface)
    {
        $this->homeInterface = $homeInterface;
    }
    public function index($id = null)
    {
        $data = Produk::with('kategori')->when($id, function ($query) use ($id){
            $query->where('kategori_id',$id);
        })->where('status_produk','Aktif')->paginate(16);
        $namaKate = Kategori::where('id',$id)->select('nama_kategori')->first();

        $kategori = Kategori::all();

        return view('pages.index',compact('data','kategori','namaKate'));
    }

    public function detail($id)
    {
        $produk = new Produk;

        $data = $produk->with('kategori')->where('id',$id)->first();

        $another = $produk->inRandomOrder()->take(30)->get();

        return view('pages.detail',compact('data','another'));
    }

    public function keranjang()
    {
        return $this->homeInterface->get_keranjang();
    }
}
