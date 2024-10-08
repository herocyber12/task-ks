@extends('layouts.app')
@section('content')
<div class="container" style="margin-top: 5em">
    <div
        class="row"
        style="max-height: 100%; height: 80px; background-color: transparent"
    >
        <div class="col-6">
            <h3>Kategori Nama</h3>
        </div>
        <div class="col-6">
            <form>
                <div class="input-group">
                    <input
                        type="text"
                        class="form-control"
                        placeholder="Cari Produk,Kategori.... "
                    />
                    <button class="btn btn-primary">Cari</button>
                </div>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-xl-3 d-block" id="kate">
            <h5><strong>Kategori:</strong></h5>
            Elektronik
        </div>
        <div class="col-xl-9 row">
            <div class="col-xl-3 p-3">
                <a href="#" style="text-decoration: none">
                    <div class="card shadow">
                        <div class="img-fluid">
                            <img
                                src="asset/img/WhatsApp Image 2024-10-04 at 10.35.05.jpeg"
                                class="img-fluid"
                            />
                            <div class="card-body">
                                <div class="flex-column">
                                    <h5>Laptop A409JP</h5>
                                    <h6>Rp.10000</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xl-3 p-3">
                <a href="#" style="text-decoration: none">
                    <div class="card shadow">
                        <div class="img-fluid">
                            <img
                                src="asset/img/WhatsApp Image 2024-10-04 at 10.35.05.jpeg"
                                class="img-fluid"
                            />
                            <div class="card-body">
                                <div class="flex-column">
                                    <h5>Laptop A409JP</h5>
                                    <h6>Rp.10000</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xl-3 p-3">
                <a href="#" style="text-decoration: none">
                    <div class="card shadow">
                        <div class="img-fluid">
                            <img
                                src="asset/img/WhatsApp Image 2024-10-04 at 10.35.05.jpeg"
                                class="img-fluid"
                            />
                            <div class="card-body">
                                <div class="flex-column">
                                    <h5>Laptop A409JP</h5>
                                    <h6>Rp.10000</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xl-3 p-3">
                <a href="#" style="text-decoration: none">
                    <div class="card shadow">
                        <div class="img-fluid">
                            <img
                                src="asset/img/WhatsApp Image 2024-10-04 at 10.35.05.jpeg"
                                class="img-fluid"
                            />
                            <div class="card-body">
                                <div class="flex-column">
                                    <h5>Laptop A409JP</h5>
                                    <h6>Rp.10000</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>

@endsection