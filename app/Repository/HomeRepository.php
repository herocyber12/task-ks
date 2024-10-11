<?php

namespace App\Repository;
use App\Interfaces\HomeInterface;

use App\Models\Keranjang;
use App\Models\Profil;
use App\Models\Produk;
use App\Models\Kategori;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Atomescrochus\StringSimilarities\Compare;
use App\Services\GetKeranjang;

class HomeRepository implements HomeInterface{

    protected $keranjangServices;

    public function __construct(GetKeranjang $keranjangServices)
    {
        $this->services = $keranjangServices;
    }

    public function get_keranjang()
    {

        $keranjangData = $this->services->getKeranjang();

        return response()->json([
            'keranjang' => $keranjangData['keranjang']->toArray(),
            'total' => number_format($keranjangData['total'], '0', '.', '.'),
            'jumlh_data' => $keranjangData['jumlah_data'],
            'transak' => $keranjangData['transak'],
        ]);
    }

    public function delete_item_keranjang($id)
    {
        $delete = Keranjang::where('id',$id)->delete();
        if ($delete)
        {
            $stats = 'success';
            $msg = 'Berhasil menghapus item dari keranjang';
        } else {
            $stats = 'error';
            $msg = 'Gagal menghapus item dari keranjang';
        }
        return redirect()->back()->with($stats,$msg);

    }

    public function search_feat(Request $request, $id = null)
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

        $kategori = Kategori::all();

        return view('pages.index', compact('data', 'kategori', 'namaKate'));
    }

}