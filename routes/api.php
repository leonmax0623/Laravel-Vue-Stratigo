<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Route;

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

Route::get('version', function () {
    return response()->json(['version' => config('app.version')]);
});


Route::middleware('auth:api')->get('/user', function (Request $request) {
    Log::debug('User:' . serialize($request->user()));
    return $request->user();
});

// Admin pages APIs

Route::namespace('App\\Http\\Controllers\\Admin')->group(function () {
    Route::get('/admin_users', [App\Http\Controllers\Admin\UserController::class, 'get_users']);
    Route::get('/admin_users_by', [App\Http\Controllers\Admin\UserController::class, 'get_users_by_search']);
    Route::post('/admin_users_options/{id}', [App\Http\Controllers\Admin\UserController::class, 'make_user_options']);
    Route::get('/billing_contactor', [App\Http\Controllers\Admin\UserController::class, 'get_billing_contactor']);
    Route::post('/send_email', [App\Http\Controllers\Admin\UserController::class, 'send_email']);
});




Route::namespace('App\\Http\\Controllers\\API\V1')->group(function () {
    Route::get('profile', 'ProfileController@profile');
    Route::put('profile', 'ProfileController@updateProfile');

    Route::post('change-password', 'ProfileController@changePassword');

    Route::get('tag/list', 'TagController@list');
    Route::get('category/list', 'CategoryController@list');
    Route::post('product/upload', 'ProductController@upload');

    Route::post('unit/store', 'UnitsController@store')->name('store');
    Route::post('unit/updateunit', 'UnitsController@updateunit');
    Route::post('unit/duplicateunit', 'UnitsController@duplicateunit');
    Route::post('unit/removeteam', 'UnitsController@removeteam');
    Route::get('unit/list', 'UnitsController@list');
    Route::get('unit/unit_list', 'UnitsController@unit_list');
    Route::get('unit/overview', 'UnitsController@overview');
    Route::post('unit/updateunitstatus', 'UnitsController@updateunitstatus');

    Route::get('teams/list', 'TeamsController@list');
    Route::post('teams/store', 'TeamsController@store');
    Route::post('teams/saveplanner', 'TeamsController@saveplanner');

    Route::get('teammates/members', 'TeammatesController@members');
    Route::get('teammates/list', 'TeammatesController@list');
    Route::post('teammates/store', 'TeammatesController@store');
    Route::post('teammates/invite', 'TeammatesController@invite');
    Route::post('teammates/saveplanner', 'TeammatesController@saveplanner');
    Route::get('teammates/getteamdata', 'TeammatesController@getteamdata');

    Route::get('goals/list', 'GoalsController@list');
    Route::post('goals/store', 'GoalsController@store');
    Route::get('goals/getteamname', 'GoalsController@getteamname');

    Route::apiResources([
        'user' => 'UserController',
        'product' => 'ProductController',
        'category' => 'CategoryController',
        'tag' => 'TagController',
    ]);
});
