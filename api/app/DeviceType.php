<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DeviceType extends Model {

    protected $table = 'device_type';
    public $timestamps = true;

    const TYPE_GATEWAY   = 1;
    const TYPE_SENSOR = 2;
    const TYPE_CONTROLLER = 3;
    const TYPE_PUMP = 4;
    const TYPE_VALUE = 5;
    
    protected $fillable = ['code','number_port','control_command_pattern','schedule_command_pattern','name','created_at'];
    
    public function devicespecifications() {
        return $this->hasMany('App\DeviceSpecification', 'devicetype_id', 'id');
    }
}
