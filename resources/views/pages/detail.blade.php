@extends('layouts.app')
@section('content')
<div class="container" style="margin-top: 5em">
    <div
        class="col-xl-12"
        style="max-height: 100%; height: 80px; background-color: transparent"
    >
        <div class="card">
            <div class="card-body row">
                <div class="col-xl-5">
                    <img
                        src="{{asset('storage/'.$data->foto_produk)}}"
                        class="img-fluid"
                    />
                </div>
                <div class="col-xl">
                    <h4>{{$data->nama_produk}}</h4>
                    <h3>Rp. {{number_format($data->harga),'0','.','.'}}</h3>
                    <p>{{$data->deskripsi}}</p>
                    <hr />
                    <button class="btn btn-primary">Beli Sekarang</button>
                    <button class="btn btn-danger">Beli Nanti</button>
                </div>
            </div>
        </div>
        <hr />
        <div class="row">
            <span style="font-size: 21px; text-decoration: underline"
                >Poduk Lain</span
            >
            @foreach ($another as $item )
                
            <div class="col-xl-2 p-3">
                <a href="{{route('detail',['id' => $item->id])}}" style="text-decoration: none">
                    <div class="card shadow">
                        <div class="img-fluid">
                            <img
                                src="{{asset('storage/'.$item->foto_produk)}}"
                                class="img-fluid"
                            />
                            <div class="card-body">
                                <div class="flex-column">
                                    <h5>{{$item->nama_produk}}</h5>
                                    <h6>Rp. {{number_format($item->harga),'0','.','.'}}</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            @endforeach
            
        </div>
    </div>
</div>

@endsection