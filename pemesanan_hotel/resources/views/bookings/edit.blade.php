<h1>EDIT DATA</h1>

<form action="/bookings/{{$booking->id}}" method="POST">
    @method('PUT')
    @csrf
    Nama : <input type="text" name="nama" value="{{$booking->nama}}"><br>
    Nama Hotel : <input type="text" name="nama_hotel" value="{{$booking->nama_hotel}}"><br>
    check-in : <input type="text" name="check_in" value="{{$booking->check_in}}"><br>
    Jumlah : <input type="number" name="jumlah" value="{{$booking->jumlah}}"><br>
    

    <input type="submit" value="Save">
</form>