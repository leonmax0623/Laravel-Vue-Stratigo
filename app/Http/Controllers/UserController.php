<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\Team;
use App\Models\Teammate;
use App\Models\User;
use \Session;

class UserController extends Controller
{
    public function __construct()
    {
        //$this->middleware('auth');
    }

    public function signupvaccount($unit_id, $team_id)
    {
        return view('signup', compact('unit_id', 'team_id'));
    }

    public function signupSubmit(Request $request)
    {
        $data = $request->all();

        $team_id = $data['team_id'];
        $unit_id = $data['unit_id'];

        $user = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
            'type' => 'Admin',
            'role' => 'user',
            'status' => 'Inactive',
            'invited by' => 'Pedro Valdes',
            'soft_delete' => 1,
        ]);

        if ($user) {
            $team = Teammate::create([
                'team_id' => $data['team_id'],
                'user_id' => $user->id,
                'unit_id' => $data['unit_id'],
                'status' => 1,
                'type' => '0'
            ]);

            Session::flash('success_msg', __('You have successfully join team.Please login to see your profile.'));

            return redirect("/login")->with('success_msg', 'You have successfully join team.')->send();
        }
    }
}
