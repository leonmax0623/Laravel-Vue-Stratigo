<?php

namespace App\Http\Controllers\API\V1;

use App\Models\User;

use App\Http\Requests\Teams\TeamRequest;
use App\Models\Unit;
use App\Models\Team;
use Illuminate\Http\Request;

class TeamsController extends BaseController
{

    protected $teams = '';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(Team $team)
    {
        $this->middleware('auth:api');
        $this->team = $team;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function list(Request $request)
    {
        $data = $request->all();
        $unitId = $data['unit_id'];
        $users = auth()->user();
        $unitData = Unit::where('id', $unitId)->first();

        $teams = $this->team->latest()->where('unit_id', $data['unit_id'])->with('goals')->with('user')->orderBy('created_at', 'desc')->paginate(10);
        $teamAll = array('unitData' => $unitData, 'teams' => $teams, 'users' => $users);
        return $this->sendResponse($teamAll, 'Teams List');
    }


    public function store(TeamRequest $request)
    {

        $user = auth()->user()->id;

        $team = $this->team->create([
            'name' => $request->get('name'),
            'user_id' => $user,
            'unit_id' => $request->get('unit_id')
        ]);

        return $this->sendResponse($team, 'Team Created Successfully');
    }

    public function saveplanner(TeamRequest $request)
    {


        return $this->sendResponse("asdf", 'Team added Successfully');
    }
}
