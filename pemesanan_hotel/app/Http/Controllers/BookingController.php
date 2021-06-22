<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Booking;

class BookingController extends Controller
{
    public function index() 
    {
        $bookings = Booking::all();
        return view('bookings.index',compact(['bookings']));
    }
    public function create() 
    {
        return view('bookings.create');
    }
    public function store(Request $request) 
    {
        Booking::create($request->all());
        return redirect('/bookings');
    }
    public function edit($id)
    {
        $booking = Booking::find($id);
        return view('bookings.edit',compact(['booking']));
    }
    public function update(Request $request,$id)
    {
        $booking = Booking::find($id);
        $booking->update($request->all());
        return redirect('/bookings');
    }
   
    public function destroy($id)
    {
        $booking = Booking::find($id);
        $booking->delete();
        return redirect('/bookings');
    }
   
}
