<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    //
    public function get_users() {
        $users = User::where('soft_delete', 1)->get();
        return response()->json($users);
    }

    public function get_users_by_search(Request $request) {
        $user_status = $request->user_status;
        $user_type = $request->user_type;

        if($user_status == "All") {
            $users = User::where('type', $user_type)
            ->get();
        } else if($user_type == "All") {
            $users = User::where('status', $user_status)
            ->get();
        } else {
            $users = User::where('type', $user_type)
            ->where('status', $user_status)
            ->get();
        }

        return response()->json($users);
    }

    public function make_user_options(Request $request, $id) {
        $selected_option = $request->selected_option;

        $user = User::find($id);

        if($selected_option == "Make Admin") {
            $user->type = "Admin";
            $user->save();
        } else if($selected_option == "Remove Admin") {
            $user->type = "Observer";
            $user->save();
        } else {
            $user->soft_delete = 0;
            $user->save();
        }

        return response()->json($user);
    }

    public function get_billing_contactor(Request $request) {
        $value =  $request->value;
        $type = $request->type;

        $user = User::where($type, $value)->get();

        return response()->json($user);
    }

    public function send_email() {
        
    }

}
