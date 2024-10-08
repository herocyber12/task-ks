<?php

namespace Database\Factories;


use App\Models\Produk;
use App\Models\Kategori; // pastikan model Kategori ada
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Produk>
 */
class ProdukFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    
    protected $model = Produk::class;
    public function definition(): array
    {
        return [
            'nama_produk' => $this->faker->word(),
            'kategori_id' => Kategori::inRandomOrder()->first()->id,
            'harga' => $this->faker->numberBetween(50000, 5000000),
            'deskripsi' => $this->faker->sentence(10),
            'stok' => $this->faker->numberBetween(0, 100),
            'status_produk' => $this->faker->randomElement(['Aktif', 'Tidak Aktif']),
            'foto_produk' => $this->faker->image('public/storage', 640, 480, null, false),
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
