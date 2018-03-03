<?php

namespace App;

use Jenssegers\Mongodb\Eloquent\Model as Model;

class DeviceDataHistory extends Model {

    protected $connection = 'mongodb';
    protected $collection = 'device_data_history';
    protected $fillable = ['device_id', 'port_status','description'];

}
