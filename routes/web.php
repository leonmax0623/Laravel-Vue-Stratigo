<?php

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

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    //return view('welcome');
    return redirect('/dashboard');
});

Auth::routes(['verify' => false]);


Route::get('/signup-create', [App\Http\Controllers\Auth\SignupCreateController::class, 'index'])->name('signupcreate');
Route::post('/signupCreateSubmit', [App\Http\Controllers\Auth\SignupCreateController::class, 'signupCreateSubmit'])->name('signupCreateSubmit');

Route::get('/signupvaccount/{unit}/{team}', [App\Http\Controllers\UserController::class, 'signupvaccount'])->name('signupvaccount');

Route::post('/signupSubmit', [App\Http\Controllers\UserController::class, 'signupSubmit'])->name('signupSubmit');

Route::post('unit/exportcsv', 'App\Http\Controllers\HomeController@exportcsv');

Auth::routes(['verify' => true]);

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::get('logout', '\App\Http\Controllers\Auth\LoginController@logout');


Route::get('home', function () {
    return redirect('/dashboard');
});



Route::get('/{vue_capture?}', function () {
    return view('home');
})->where('vue_capture', '[\/\w\.-]*')->middleware('auth');
