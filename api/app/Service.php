<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Service extends Model {

    protected $table = 'service';
    public $timestamps = true;

    protected $fillable = ['name','status','created_at'];
    
}
