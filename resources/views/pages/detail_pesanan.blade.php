@extends('layouts.app')
@section('content')
<div class="breadcrumb_section bg_gray page-title-mini" style="margin-top: 5.5em;">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6">
                <div class="page-title">
                    <h1>Keranjang Belanja</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="section" style="margin-bottom: 250px;;">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive shop_cart_table">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Gambar</th>
                                <th>Produk</th>
                                <th>Jumlah</th>
                                <th>Harga</th>
                                <th>Hapus</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($keranjang as $item )
                            <tr>
                                <td>
                                    <img src="{{asset('storage/'.$item->produk->foto_produk)}}" class="img-fluid" alt="{{$item->nama_produk}}" width="180px">
                                </td>
                                <td class="align-middle">
                                    {{$item->produk->nama_produk ?? 'Produk Tidak ada'}}
                                </td>
                                <td class="align-middle">
                                    {{$item->quantity}}
                                </td>
                                <td class="align-middle">
                                    {{'Rp. '.number_format($item->produk->harga, '0',',',',') ?? 'Porduk tidak ada'}}
                                </td>
                                <td class="align-middle">
                                    <button type="button" class="btn btn-danger btn-sm" onclick="window.location.href='{{route('delete.item-keranjang',['id' => $item->id])}}'"><i class="fa-solid fa-close"></i></button>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="divider center_icon mt-5 mb-5"><i class="ti-shopping-cart-full"></i></div>
        
        <div class="row">
            <div class="col-md-12">
                <div class="border p-3 p-md-4">
                    <div class="table-responsive mb-0">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td class="cart_total_label">Total</td>
                                    <td class="text-end">Rp. {{number_format($total,'0',',',',')}}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    {{-- <form action="{{route('store.checkouts')}}" method="post">
                        @csrf
                        <button type="submit" class="btn btn-primary"{{$total === 0 ? 'disabled' : ''}}>Checkout</button>
                    </form> --}}
                    <button type="button" class="btn btn-primary" onclick="window.location.href='{{route('store.checkouts')}}'" {{$total === 0 ? 'disabled' : ''}}>Checkout</button>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection