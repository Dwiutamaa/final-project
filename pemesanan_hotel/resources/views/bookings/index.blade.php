<h1>List Pemesanan Hotel</h1>
<table>
    <thead>
        <tr>
            <th>Nama</th>
            <th>Hotel</th>
            <th>check-in</th>
            <th>jumlah</th>

        </tr>
    </thead>
    <tbody>
        @foreach ($bookings as $booking)
        <tr>
            <td>{{$booking->nama}}</td>
            <td>{{$booking->nama_hotel}}</td>
            <td>{{$booking->check_in}}</td>
            <td>{{$booking->jumlah}}</td>
            <td>
                <a href="/bookings/{{$booking->id}}/edit">Edit</a>
                <form action="/bookings/{{$booking->id}}" method="post">
                @method('DELETE')
                @csrf
                <input type="submit" value="Hapus">
                </form>
            </td>
        </tr>
        @endforeach
     
    </tbody>
</table>
<a href="/bookings/create">Tambah</a>