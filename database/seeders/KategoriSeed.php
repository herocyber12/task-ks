<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Kategori;

class KategoriSeed extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $kategori = [
            'Elektronik','HP','Laptop'
        ];

        foreach($kategori as $kt)
        {
            Kategori::create([
                'nama_kategori' => $kt
            ]);
        }
    }
}
