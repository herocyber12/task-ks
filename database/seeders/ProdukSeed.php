<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Produk;
class ProdukSeed extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Produk::factory(100)->create();
    }
}
