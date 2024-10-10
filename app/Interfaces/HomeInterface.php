<?php

namespace App\Interfaces;

interface HomeInterface {
    public function get_keranjang();
    public function delete_item_keranjang($id);
}