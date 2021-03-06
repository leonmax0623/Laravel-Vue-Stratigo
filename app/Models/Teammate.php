<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Teammate extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id', 'unit_id', 'team_id', 'status','type','description'
    ];


    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function team()
    {
        return $this->belongsTo(Team::class);
    }

    public function unit()
    {
        return $this->belongsTo(Unit::class);
    }

    // public function tags()
    // {
    //     return $this->belongsToMany(Tag::class)->select(['name as text','id']);
    // }
}
