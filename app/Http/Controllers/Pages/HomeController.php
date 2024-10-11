<?php

namespace App\Http\Controllers\Pages;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Produk;
use App\Models\Kategori;
use App\Interfaces\HomeInterface;
use Atomescrochus\StringSimilarities\Compare;

class HomeController extends Controller
{
    protected $homeInterface;
    public function __construct(HomeInterface $homeInterface)
    {
        $this->homeInterface = $homeInterface;
    }
    public function index(Request $request, $id = null)
    {
        if ($request->search) {
            $rekomendasiProduk = Produk::with('kategori')->get();
            $compare = new Compare;
            $produks = [];

            foreach ($rekomendasiProduk as $item) 
            {
                $nameSimilarity = $compare->jaroWinkler($request->search, $item->nama_produk);
                $deskripsiSimilarity = $compare->jaroWinkler($request->search, $item->deskripsi);
                $kategoriSimilarity = $compare->jaroWinkler($request->search, $item->kategori->nama_kategori ?? '');

                $maxSimilarity = max($nameSimilarity, $deskripsiSimilarity, $kategoriSimilarity);

                if ($maxSimilarity > 0.5) {
                    $produks[] = [
                        'produk' => $item,
                        'similarity' => $maxSimilarity
                    ];
                }
            }

            usort($produks, function($a, $b) {
                return $b['similarity'] <=> $a['similarity'];
            });

            $data = $produks;
            $namaKate = "Pencarian '" . $request->search . "'";

        } else {
            $data = Produk::with('kategori')->when($id, function ($query) use ($id) {
                $query->where('kategori_id', $id);
            })->where('is_active', true)->paginate(16);

            $namaKate = $id ? Kategori::where('id', $id)->select('nama_kategori')->first()->nama_kategori : 'Semua Produk';
        }

        // Ambil data kategori untuk sidebar atau filter
        $kategori = Kategori::all();

        return view('pages.index', compact('data', 'kategori', 'namaKate'));
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
