<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

Class Sale extends Model
{
    protected $table = 'sales';


    public $timestamps = false;

    protected $fillable = ['buyer','totalPrice', 'videogameId'];

    public function videoGames(){
        return this->belongsTo(VideoGame::class, 'videogameId');
    }
}