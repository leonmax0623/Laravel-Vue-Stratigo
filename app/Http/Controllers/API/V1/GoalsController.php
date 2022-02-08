<?php

namespace App\Http\Controllers\API\V1;

use App\Models\User;
use App\Models\Goal;
use App\Models\Unit;
use App\Models\Team;
use Illuminate\Http\Request;

class GoalsController extends BaseController
{

    protected $teams = '';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(Goal $goal)
    {
        $this->middleware('auth:api');
        $this->goal = $goal;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function list(Request $request)
    {
        $users = User::select('name', 'email')->get();
        $data = $request->all();
        $unitId = $data['unit_id'];
        $unitData = Unit::where('id', $unitId)->first();
        $teamData = Team::where('id', $data['team_id'])->first();
        $goals = $this->goal->latest()->where('unit_id', $data['unit_id'])->where('team_id', $data['team_id'])->with('user')->paginate(10);
        $goalsAll = array('unitData' => $unitData, 'teamData' => $teamData, 'goals' => $goals, 'users' => $users);
        return $this->sendResponse($goalsAll, 'Goals List');
    }

    public function getteamname(Request $request)
    {
        $userid = $request->get('user_id');
        $teamid = $request->get('team_id');
        $teamname = Team::where('id', $teamid)->first();
        $username = User::where('id', $userid)->first();
        $name = array('teamname' => $teamname, 'username' => $username);
        return $this->sendResponse($name, "name");
    }

    public function store(Request $request)
    {

        $user = auth()->user()->id;
        $name = $request->get('name');
        $team = Team::where('name', $name)->first();
        $team = $this->goal->create([
            'team_id' => $team->id,
            'goal_name' => $request->get('goal_name'),
            'user_id' => $user,
            'unit_id' => $request->get('unit_id')
        ]);

        return $this->sendResponse($team, 'Team Created Successfully');
    }

    public function saveplanner(Request $request)
    {


        return $this->sendResponse("asdf", 'Team added Successfully');
    }
}
