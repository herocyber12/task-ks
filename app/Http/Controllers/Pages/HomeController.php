<?php

namespace App\Http\Controllers\Pages;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Produk;
use App\Interfaces\HomeInterface;

class HomeController extends Controller
{
    protected $homeInterface;
    public function __construct(HomeInterface $homeInterface)
    {
        $this->homeInterface = $homeInterface;
    }
    
    public function index(Request $request, $id = null)
    {
        return $this->homeInterface->search_feat($request,$id);
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

    public function delete_keranjang($id)
    {
        return $this->homeInterface->delete_item_keranjang($id);
    }
}
