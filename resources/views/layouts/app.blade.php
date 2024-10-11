<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>E-Commerce</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="{{ asset('css/style.css') }}" rel="stylesheet" />
@yield('css')

<body>
    <nav class="navbar navbar-expand-lg navbar-light shadow-md position-fixed w-100 top-0 shadow" {{--
        style="z-index: 99999; background-color: white" --}}>
        <div class="container">
            <a class="navbar-brand" href=""> [Logo] </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
                <ul class="navbar-nav me-auto fw-semibold text-dark">
                    <li class="nav-item">
                        <a class="nav-link {{request()->routeIs('landing')?'active' : ''}}"
                            href="{{route('landing')}}">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            Kategori
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            @php
                                $kategori = \App\Models\Kategori::all();
                            @endphp
                            @if ($kategori->count() != 0)
                            @foreach ($kategori as $item )
                            <li>
                                <a class="dropdown-item" href="{{route('kategori',['id' => $item->id])}}">
                                    {{$item->nama_kategori}}
                                </a>
                            </li>
                            @endforeach
                            @else
                            <li>
                                <a class="dropdown-item" href="#">Kategori Belum Tersedia</a>
                            </li>
                            @endif
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{request()->routeIs('')?'active' : ''}}" href="">Hubungi Kami</a>
                    </li>
                </ul>
                @if (auth()->user())
                <div class="ms-auto d-flex">
                    
                    <div class="nav-item dropdown">
                        <a class="me-3 nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa-solid fa-cart-shopping"></i> <sup id="sup" class="">0</sup>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <div id="item-keranjang"></div>
                        </div>
                    </div>

                    <div class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false" style="text-decoration: none; color:black;"> <i class="fa-solid fa-user"></i> </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li>
                                 <a href="{{route('profil')}}" class="dropdown-item"> <i class="fa-solid fa-gear"></i> Profil</a>
                             </li> 
                            <li>
                                 <a href="{{url('logout')}}" class="dropdown-item"> <i class="fa-solid fa-power-off"></i> Logout</a>
                             </li> 
                        </ul>
                    </div>
                </div>

                @else
                <button class="btn btn-success" onclick="window.location.href='{{url('login')}}'">Login</button>
                @endif
            </div>
        </div>
    </nav>

    <div style="z-index: 0">@yield('content')</div>


    <script src="https://app.sandbox.midtrans.com/snap/snap.js" data-client-key="{{ config('midtrans.client_key') }}"></script>
    <script 
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" 
        integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
        crossorigin="anonymous"
        referrerpolicy="no-referrer"
    ></script>
    <script 
        src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/all.min.js"
        integrity="sha512-6sSYJqDreZRZGkJ3b+YfdhB3MzmuP9R7X1QZ6g5aIXhRvR1Y/N/P47jmnkENm7YL3oqsmI6AK+V6AD99uWDnIw=="
        crossorigin="anonymous" 
        referrerpolicy="no-referrer"
    ></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script 
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"
    ></script>
    
    <script>
        $(document).ready(function() {
            $.ajax({
                url: "{{ url('keranjang') }}",
                type: "GET",
                success: function(data) {
                    var keranjang = data.keranjang;
                    var totalTarif = data.total;
                    var html = "";

                    $.each(keranjang, function(index, item) {
                        const harga = new Intl.NumberFormat('id-ID', {
                            minimumFractionDigits: 0,
                            maximumFractionDigits: 0,
                        }).format(item.produk.harga);
                        html += "<li class='dropdown-item'>";
                        html += "<span>" + item.produk.nama_produk + "</span> - ";
                        html += "<span> " + item.quantity + " pcs </span> - ";
                        html += "<span> Rp " + harga + "</span>";
                        
                        var deleteUrl = "/hapus-pesanan/" + item.id;
                        html += `<span> <a href="${deleteUrl}" class='btn btn-danger btn-sm'> <i class='fa-solid fa-trash-can'></i> </a> </span>`;
                        html += "</li>";
                    });

                    if (data.transak) {
                        html += "<li class='dropdown-item'>";
                        html += "<strong>Total: " + totalTarif + "</strong>";
                        html += "</li>";
                        html += "<li><form action='{{route('detail.pesanan')}}' method='get'>";
                        html += "<button type='submit' class='btn btn-success btn-sm ms-2'>Check Out</button>";
                        html += "</form></li>";
                    }
                    
                    $("#sup").html(data.jumlh_data);
                    $("#item-keranjang").html(html);
                },
                error: function(xhr, status, error) {
                    console.log('Terjadi kesalahan: ' + error);
                }
            });
        });

    </script>
    @yield('js')
</body>

</html>
{{-- {{dd(session('snaptoken'))}} --}}
@if(session('snaptoken'))
    <script>
    snap.pay("{{session('snaptoken')}}", {
        onSuccess: function(result) {
            location.reload();
            alert('Pembayaran berhasil!');
        },
        onPending: function(result) {
            alert('Pembayaran pending!');
        },
        onError: function(result) {
            alert('Terjadi kesalahan saat pembayaran!');
        }
    });
    </script>
@endif

    @if(session('success'))
        <script>
            Swal.fire({
                icon: 'success',
                title: 'Success',
                text: '{{ session('success') }}',
            });
        </script>
    @endif

    @if(session('error'))
        <script>
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: '{{ session('error') }}',
            });

        </script>
        @endif