<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Team extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    protected $fillable = [
        'user_id', 'unit_id', 'name', 'status'
    ];


    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function unit()
    {
        return $this->belongsTo(Unit::class);
    }

    public function teammate()
    {
        return $this->hasMany('App\Models\Teammate', 'team_id', 'id');
    }

    public function goals()
    {
        return $this->hasMany(Goal::class, 'team_id', 'id');
    }

    public function planner()
    {
        return $this->hasMany('App\Models\Teammate', 'team_id', 'id')->where('type', '0')->with('user');
    }

    public function colleborator()
    {
        return $this->hasMany('App\Models\Teammate', 'team_id', 'id')->where('type', '1')->with('user');
    }

    // public function tags()
    // {
    //     return $this->belongsToMany(Tag::class)->select(['name as text','id']);
    // }
}
