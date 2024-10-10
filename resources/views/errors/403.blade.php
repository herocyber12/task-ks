<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>403 Forbidden</title>
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
</head>
<body>
    <div class="container">
        <h1>403 | Forbidden</h1>
        <p>Anda Tidak Memiliki Akses ke halaman tersebut</p>
        <a href="{{ route('landing') }}">Go to Homepage</a> <!-- Link kembali ke halaman utama -->
    </div>
</body>
</html>
