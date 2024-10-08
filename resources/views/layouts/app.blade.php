<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>E-Commerce</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
        />
    </head>
    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
        integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
        crossorigin="anonymous"
        referrerpolicy="no-referrer"
    />
    <link href="{{ asset('css/style.css') }}" rel="stylesheet" />
    @yield('css')

    <body>
        <nav
            class="navbar navbar-expand-lg navbar-light shadow-md position-fixed w-100 top-0 shadow"
            {{-- style="z-index: 99999; background-color:white;" --}}
            >
            <div class="container">
                <a class="navbar-brand" href="">
                    [Logo]
                </a>
                <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarNav"
                    aria-controls="navbarNav"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                >
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div
                    class="collapse navbar-collapse justify-content-between"
                    id="navbarNav"
                >
                    <ul class="navbar-nav mx-auto fw-semibold text-dark">
                        <li class="nav-item">
                            <a
                                class="nav-link {{request()->routeIs('landing')?'active' : ''}}"
                                href="{{route('landing')}}"
                                >Home</a
                            >
                        </li>
                        <li class="nav-item dropdown">
                            <a
                                class="nav-link dropdown-toggle"
                                href="#"
                                id="navbarDropdown"
                                role="button"
                                data-bs-toggle="dropdown"
                                aria-expanded="false"
                            >
                                Kategori
                            </a>
                            <ul
                                class="dropdown-menu"
                                aria-labelledby="navbarDropdown"
                            >
                            @foreach (\App\Models\Kategori::all() as $item )
                            <li>
                                <a class="dropdown-item" href="{{route('kategori',['id' => $item->id])}}"> {{$item->nama_kategori}} </a>
                            </li>
                            @endforeach
                                
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a
                                class="nav-link {{request()->routeIs('')?'active' : ''}}"
                                href=""
                                >Hubungi Kami</a
                            >
                        </li>
                    </ul>
                    <button class="btn btn-success">Login</button>
                </div>
            </div>
        </nav>

        <div style="z-index: 0;">

            @yield('content')
        </div>

        <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"
        ></script>

        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/all.min.js"
            integrity="sha512-6sSYJqDreZRZGkJ3b+YfdhB3MzmuP9R7X1QZ6g5aIXhRvR1Y/N/P47jmnkENm7YL3oqsmI6AK+V6AD99uWDnIw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
        ></script>
        @yield('js')
    </body>
</html>
