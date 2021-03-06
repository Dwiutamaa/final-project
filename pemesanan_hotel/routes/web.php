<?php

use App\Http\Controllers\BookingController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/bookings',[BookingController::class,'index']);
Route::get('/bookings/create',[BookingController::class,'create']);
Route::post('/bookings',[BookingController::class,'store']);
Route::get('/bookings/{id}/edit',[BookingController::class,'edit']);
Route::put('/bookings/{id}',[BookingController::class,'update']);
Route::delete('/bookings/{id}',[BookingController::class,'destroy']);
Route::get('/bookings/detail/{id}',[BookingController::class,'show']);