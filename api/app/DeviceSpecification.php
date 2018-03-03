<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DeviceSpecification extends Model {

    protected $table = 'device_specification';
    public $timestamps = true;

    protected $fillable = ['devicetype_id','value','name','description','created_at'];
    
}
