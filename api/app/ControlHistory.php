<?php

namespace App;

use Jenssegers\Mongodb\Eloquent\Model as Model;

class ControlHistory extends Model {

    protected $connection = 'mongodb';
    protected $collection = 'control_history';
    protected $fillable = ['sensor_data'];

}
