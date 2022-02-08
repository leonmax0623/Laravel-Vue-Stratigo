<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Models\Unit;

class Goal extends Model
{
    protected $fillable = [
        'goal_name', 'description', 'unit_id', 'user_id', 'team_id', 'objectives'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function unit()
    {
        return $this->belongsTo(Unit::class);
    }

    public function team()
    {
        return $this->belongsTo(Team::class);
    }
}
