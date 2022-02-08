<?php

namespace App\Http\Controllers\API\V1;

use DB;
use App\Http\Requests\Units\UnitRequest;
use App\Models\Unit;
use App\Models\Team;
use App\Models\TblTeamStatus;
use App\Models\TblUnitStatus;
use Illuminate\Http\Request;



class UnitsController extends BaseController
{

    protected $unit = '';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(Unit $unit)
    {
        $this->middleware('auth:api');
        $this->unit = $unit;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function list()
    {
        $units = $this->unit->latest()->with('user')->paginate(10);
        return $this->sendResponse($units, 'units_teams');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */


    public function updateunitstatus(Request $request)
    {
        print_r($request->all());
        $user = auth()->user()->id;
        $unit_id = $request->get('unit_id');
        $unit = TblUnitStatus::create([
            'title' => $request->get('title'),
            'user_id' => $user,
            'unit_id' => $unit_id,
            'custom_fields' => json_encode($request->get('custom_fields'))
        ]);

        return $this->sendResponse($unit, 'Unit Status Successfully Updated');
    }

    public function store(UnitRequest $request)
    {
        $user = auth()->user()->id;

        $unit = $this->unit->create([
            'unit_name' => $request->get('unit_name'),
            'user_id' => $user,
        ]);
        Team::create([
            'name' => $request->get('name'),
            'user_id' => $user,
            'unit_id' => $unit->id,
        ]);

        return $this->sendResponse($unit, 'Unit Created Successfully');
    }

    public function updateunit(Request $request)
    {

        $user = auth()->user()->id;
        $unit = $this->unit->findOrFail($request->get('unit_id'));

        $unit->update($request->all());


        return $this->sendResponse($unit, 'Unit Updated Successfully');
    }

    public function duplicateunit(Request $request)
    {

        $user = auth()->user()->id;
        $unit = $this->unit->findOrFail($request->get('unit_id'));

        $newunit = $this->unit->create([
            'unit_name' => $request->get('unit_name'),
            'user_id' => $user
        ]);

        $teams = Team::where('unit_id', $unit->id)->orderBy('id', 'ASC')->get();
        foreach ($teams as $team) {
            Team::create([
                'name' => $team->name,
                'user_id' => $team->user_id,
                'unit_id' => $newunit->id
            ]);
        }

        return $this->sendResponse($newunit, 'Unit Copy Successfully');
    }

    public function unit_list(Request $request)
    {
        $userId = auth()->user()->id;

        $unitlist = Unit::where('id', '>', 0)->with('teams')->orderBy('created_at', 'desc')->get();
        return $this->sendResponse($unitlist, "unitlist");
    }

    public function removeteam(Request $request)
    {

        $unit_id = $request->get('unit_id');
        $unit = Unit::find($unit_id);
        $result = $unit->delete();


        return $this->sendResponse($result, 'Unit Removed Successfully');
    }
}
