<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BookingApiController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('/bookings',[BookingApiController::class,'index']);
Route::get('/bookings/create',[BookingApiController::class,'create']);
Route::post('/bookings',[BookingApiController::class,'store']);
Route::get('/bookings/{id}/edit',[BookingApiController::class,'edit']);
Route::put('/bookings/{id}',[BookingApiController::class,'update']);
Route::delete('/bookings/{id}',[BookingApiController::class,'destroy']);
Route::get('/bookings/{id}',[BookingApiController::class,'show']);


Route::group(['prefix' => 'v1'], function () {
    Route::post('/login', 'App\Http\Controllers\UsersController@login');
    Route::post('/register', 'App\Http\Controllers\UsersController@register');
    Route::get('/logout', 'App\Http\Controllers\UsersController@logout')->middleware('auth:api');
});

