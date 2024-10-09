@extends('layouts.app')
@section('content')
<div class="container" style="margin-top: 5em">
    <div
        class="row"
        style="max-height: 100%; height: 80px; background-color: transparent"
    >
        <div class="col-6">
            <h3>{{request()->routeIs('kategori') ? $namaKate->nama_kategori:'Pilih Kategori'}}</h3>
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
            <div class="flex-column">
                @foreach ($kategori as $kt )

                <div style="font-size: 32px"> <a href="{{route('kategori',['id' => $kt->id])}}">{{$kt->nama_kategori}}</a> </div>
                @endforeach
            </div>
        </div>
        
        @if ($data)
        <div class="col-xl-9 row">
        @foreach ($data as $item )
            <div class="col-xl-3 p-3">
                <a href="{{route('detail',['id' => $item->id])}}" style="text-decoration: none">
                    <div class="card shadow">
                        <div class="img-fluid">
                            <img
                                src="{{asset('storage/'.$item->foto_produk)}}"
                                class="img-fluid"
                            />
                            <div class="card-body">
                                <div class="flex-column">
                                    <h5> {{$item->nama_produk}} </h5>
                                    <h6>Rp. {{number_format($item->harga),'0','.','.'}} </h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            @endforeach
            {{$data->links()}}
        </div>
        @else
        <div class="col-xl-9 my-auto" style="height:1000px;">

            <div class="text-center">Produk Tidak ada</div>
        </div>
        @endif
    </div>
</div>

@endsection