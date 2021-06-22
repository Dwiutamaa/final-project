<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Booking;

class BookingApiController extends Controller
{
    public function index() 
    {
        $bookings = Booking::all();
        return response()->json(['messege' => 'succes','data' => $bookings]);
    }
    public function show($id)
    {
        $booking = Booking::find($id);
        return response()->json(['message' => 'Sukses', 'data' => $booking]);
    }
    public function store(Request $request) 
    {
        $booking = Booking::create($request->all());
        return response()->json(['message' => 'Pemesanan Berhasil Dilakukan !', 'data' => $booking]);
    }
    
    public function update(Request $request,$id)
    {
        $booking = Booking::find($id);
        $booking->update($request->all());
        return response()->json(['message' => 'Sukses', 'data' => $booking]);
    }
    
   
    public function destroy($id)
    {
        $booking = Booking::find($id);
        $booking->delete();
        return response()->json(['message' => 'Data Berhasil Di hapus !', 'data' => null]);
    }
   
}
