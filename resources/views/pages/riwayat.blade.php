@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row align-items-center vh-100">
        <div class="col-xl-12">
            <div class="btn-group ">
            <a href="{{url('riwayat-pembelian')}}" class="btn btn-info text-white">Riwayat</a>
                <a href="{{route('profil')}}" class="btn btn-info text-white">Profil</a>
            </div>
            <table class="table table-responsive table-striped">
                    <thead>
                        <tr>
                            <th>Nama Produk</th>
                            <th>Kategori</th>
                            <th>Jumlah Beli</th>
                            <th>Harga</th>
                            <th>Status Pembayaran</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($data as $item)
                        @php
                            $id = $item->keranjang->produk->id ?? 'null';
                        @endphp
                        <tr>
                            <td> <a href="{{route('detail',['id' => $id ])}}" class="text-black" style="text-decoration: none;">{{$item->keranjang->produk->nama_produk ?? 'Data tidak ada'}} </a> </td>
                            <td>{{$item->keranjang->produk->kategori->nama_kategori ?? 'Data tidak ada'}}</td>
                            <td>{{$item->keranjang->quantity ?? 'Data tidak ada'}}</td>
                            <td>Rp. {{number_format($item->keranjang->produk->harga, '0',',',',')}}</td>
                            <td>
                                @if ($item->status_pembayaran == 'Pending')
                                <button class="btn badge bg-warning rounded-pill text-white" data-id="{{$item->id}}" value="{{$item->snap_token}}"> Pending </button>
                                @elseif ($item->status_pembayaran == 'Lunas')
                                <div class="badge bg-success rounded-pill text-white"> Lunas </div>
                                @elseif ($item->status_pembayaran == 'Belum Lunas')
                                <button type="button" data-id="{{$item->id}}" class="btn btn-primary btn-sm bayarId" value="{{$item->snap_token}}">Bayar</button>
                                @elseif ($item->status_pembayaran == 'Transaksi Dibatalkan')
                                <div class="badge bg-danger rounded-pill text-white"> Dibatalkan </div>
                                @elseif ($item->status_pembayaran == 'Transaksi Kadaluarsa')
                                <div class="badge bg-danger rounded-pill text-white"> Kadaluarsa </div>
                                @endif
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
        </div>
        
    </div>
</div>
@endsection
@section('js')
    <script>
        $(document).on('click', '.bayarId', function() {
            var id = $(this).data('id');
            var snapToken = $(this).val();

            snap.pay(snapToken,{
                onSuccess: function(result) {
                    console.log('success', result);
                    alert('Pembayaran berhasil!');
                },
                onPending: function(result) {
                    console.log('pending', result);
                    alert('Pembayaran pending!');
                },
                onError: function(result) {
                    console.log('error', result);
                    alert('Terjadi kesalahan saat pembayaran!');
                }
            })
        });
    </script>
@endsection