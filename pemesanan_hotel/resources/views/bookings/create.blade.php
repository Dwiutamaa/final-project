<h1>TAMBAH DATA</h1>

<form action="/bookings" method="post">
    @csrf
    Nama : <input type="text" name="nama"><br>
    Nama Hotel : <input type="text" name="nama_hotel"><br>
    check in : <input type="text" name="check_in"><br>
    jumlah : <input type="number" name="jumlah"><br>

    <input type="submit" value="Save">
</form>