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
                    <form action="" method="post" id="myForm">
                        @csrf
                        @if ($data->stok === 0 || $data->stok === 1)
                            @php
                                $disabled = 'disabled';
                            @endphp
                        @else
                            @php
                                $disabled = '';
                            @endphp
                        @endif
                        <div class="input-group mb-3" style="max-width: 100%; width:8em;">
                            <button type="button" class="sub btn btn-secondary btn-sm">-</button>
                            <input type="number" value="1" min="1" max="{{$data->stok}}" id="quantity" name="quantity" class="form-control text-center" />
                            <button type="button" class="add btn btn-secondary btn-sm" {{$disabled}}
                                >+</button>
                        </div>
                        <button type="button" class="btn btn-primary btn-konfirm" value="sekarang" {{$disabled}}>Beli Sekarang</button>
                        <button type="button" class="btn btn-danger btn-konfirm" value="nanti" {{$disabled}}>Beli Nanti</button>
                    </form>
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
@section('js')
    <script>
        $(document).ready(function(){
            $('.add').click(function () {
                if($('#quantity').val() >= parseInt('{{$data->stok}}')-1){
                    $(this).prop('disabled',true);
                }
                $(this).prev().val(+$(this).prev().val() + 1);
            });
            $('.sub').click(function () {
                if($('#quantity').val() <= '{{$data->stok}}'){
                    $('.add').prop('disabled',false);
                }
                if ($(this).next().val() > 1) $(this).next().val(+$(this).next().val() - 1);
            });

            $('.btn-konfirm').click(function (){
                var url;
                var state = $(this).val();
                console.log(state);
                if(state === 'sekarang')
                {
                    url = "{{route('store.langsung',['id' => $data->id])}}";
                } else if(state === 'nanti'){
                    url = "{{route('store.keranjang',['id' => $data->id])}}";
                } else {
                    alert('terjadi kesalahan');
                }

                $('#myForm').attr('action',url);
                $('#myForm').submit();
            });
        });
    </script>

    @if(session('successs'))
        <script>
            window.location.href='';
        </script>
    @endif

@endsection