<?php

namespace App\Interfaces;
use Illuminate\Http\Request;

interface HomeInterface {
    public function get_keranjang();
    public function delete_item_keranjang($id);
    public function search_feat(Request $request, $id = null);
}