@extends('layouts.app')
@section('css')
<style>
    .pp{
        width: 320px;
    }
    @media (max-width: 991.98px)
    {
        .contsa{

            padding-top: 5.5em !important;
        }
        .pp{
            width: 100% !important;
            }
    }
</style>
    
@endsection
@section('content')
<div class="container contsa">
    <div class="row align-items-center" style="height:920px;" >
        
        <form action="{{route('update')}}" class="row" method="post" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="d-flex">
                <div>
                    <div class="btn-group ">
                        <a href="{{url('riwayat-pembelian')}}" class="btn btn-info text-white">Riwayat</a>
                        <a href="{{route('profil')}}" class="btn btn-info text-white">Profil</a>
                    </div>
                </div>
            </div>
        <div class="col-xl-3 offset-xl-2 pt-2">
            @if($profil->foto_profil)
            @php
            $foto = asset('storage/'.$profil->foto_profil);
            @endphp
            @else
            @php
                
            $foto = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";
            @endphp
            @endif
            <img src="{{$foto}}" class="img-fluid mt-2 text-center pp" alt="" style="max-height: 100%;" width="320">
            <input type="file" accept="image/*" name="foto_profil" class="form-control mt-2">
        </div>
        <div class="col-xl-6 pt-2">
            <div class="mb-3">
                <input type="text" name="name" class="form-control" value="{{$profil->name ?? 'N/A'}}" placeholder="masukan nama anda" require>
            </div>
            <div class="mb-3">
                <input type="email" name="email" class="form-control" value="{{Auth::user()->email ?? 'N/A'}}" placeholder="masukan email andaa" require>
            </div>
            <div class="mb-3">
                <input type="text" name="alamat" class="form-control" value="{{ $profil->alamat ??'N/A' }}" placeholder='Alamat Belum diisi'>
            </div>
            <div class="mb-3">
                <input type="text" name="no_hp" minlength="8" maxlength="13" class="form-control" placeholder="masukan no hp aktif anda" value="{{$profil->no_hp ?? null}}" require>
            </div>
            <div class="d-flex justify-content-between">
            <button type="submit" class="btn btn-success mb-3">Ubah</button>
            </div>
        </div>
        </form>
    </div>
</div>
    
@endsection
@section('js')
    <script>
        $(document).ready(function(){
            
        $('#riwayat').DataTable();
        });
    </script>
@endsection