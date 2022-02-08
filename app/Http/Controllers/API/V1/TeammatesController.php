<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Requests\Teammates\TeammateRequest;
use App\Models\Unit;
use App\Models\Team;
use App\Models\Teammate;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\Mail as Mail;
use Illuminate\Support\Facades\Validator;

class TeammatesController extends BaseController
{

    protected $teams = '';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(Teammate $teammate)
    {
        $this->middleware('auth:api');
        $this->teammate = $teammate;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function list(Request $request)
    {
        $user = auth()->user()->id;
        $data = $request->all();
        $unitId = $data['unit_id'];

        $teammates = $this->teammate->latest()->where('unit_id', $data['unit_id'])->with('user', 'team')->paginate(10);

        $teammateAll = array('teammates' => $teammates);
        return $this->sendResponse($teammateAll, 'Teammates List');
    }

    public function members(Request $request)
    {
        $user = auth()->user()->id;

        $data = User::where('role', 'user')->get();

        //dd($data);

        return $this->sendResponse($data, 'Users List');
    }


    public function store(Request $request)
    {

        $user = auth()->user()->id;
        $data = $request->all();

        $rules = [
            'team_id'         =>   'required',
            'unit_id'          =>   'required',
            'email'                 =>   'required'
        ];
        //$this->validate($request, $rules);
        $validator = Validator::make($request->all(), $rules);
        if (isset($data['team_id']) && $data['team_id'] != '') {
            $teamData = Team::where('id', $data['team_id'])->select('name')->first();

            $team_id = $data['team_id'];
            $unit_id = $data['unit_id'];

            $link =  url("signupvaccount/$unit_id/$team_id");

            $email_arr = explode(',', $data['email']);

            if (!empty($email_arr)) {
                foreach ($email_arr as $email) {
                    $username = strstr($email, '@', true);
                    $UserObj = new \stdClass();
                    $UserObj->email = $email;
                    $UserObj->full_name = $username;

                    $emaildata = ["name" => $username, "email" => $email, 'link' => $link];
                    //         $mail = Mail::sendMail('mail/invite_email', 'Invite to team email from Startego', $emaildata, $UserObj);
                }
            }
        }

        return $this->sendResponse("success", 'Invitation sent to user successfully');
    }


    public function saveplanner(Request $request)
    {

        $user = auth()->user()->id;
        $data = $request->all();

        if (isset($data['selection']) && $data['selection'] != '') {
            $team = $this->teammate->create([
                'team_id' => $data['team_id'],
                'description' => $data['description'],
                'user_id' => $data['selection'],
                'unit_id' => $data['unit_id'],
                'status' => 1,
                'type' => '0'
            ]);
        }

        if (isset($data['selectionautocolleb']) && $data['selectionautocolleb'] != '') {
            $team = $this->teammate->create([
                'team_id' => $data['team_id'],
                'description' => $data['description'],
                'user_id' => $data['selectionautocolleb'],
                'unit_id' => $data['unit_id'],
                'status' => 1,
                'type' => '1'
            ]);
        }


        return $this->sendResponse($team, 'Teammate added Successfully');
    }

    public function getteamdata(Request $request)
    {
        $user = auth()->user()->id;
        $data = $request->all();
        $user_id = $data['user_id'];
        $unit_id = $data['unit_id'];

        if ($unit_id != '' && $user_id != '') {
            $teamData = Teammate::where('unit_id', $unit_id)->where('user_id', $user_id)->with('team')->get();
            return $teamData;
        }
    }
}
