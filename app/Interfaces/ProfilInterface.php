<?php

namespace App\Interfaces;
use App\Http\Requests\ProfilRequest;

interface ProfilInterface
{
    public function riwayat();
    public function update(ProfilRequest $request);
}
