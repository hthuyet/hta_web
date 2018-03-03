<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Auth;

class Device extends Model {

    protected $table = 'device';
    public $timestamps = true;

    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    protected $appends = ['driver'];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = ['driver'];

    public function getDriverAttribute() {
        $className = 'App\\Driver\\' . $this->devicetype->code;
        $driver = new $className($this);
        return $driver;
    }

    const STATUS_IMPORTWAREHOUSE = 0;
    const STATUS_ASSIGNCUSTOMER = 1;
    const STATUS_ACTIVED = 2;
    const STATUS_LOST = 4;

    protected $fillable = ['name', 'code', 'devicetype_id', 'long', 'lat',
        'manufacture_date', 'warranty_date', 'assign_id', 'status', 'user_id', 'port_status'];

    public function devicetype() {
        return $this->hasOne('App\DeviceType', 'id', 'devicetype_id');
    }

    public function devicespecifications() {
        return $this->hasMany('App\DeviceSpecification', 'devicetype_id', 'devicetype_id');
    }

    public function assign() {
        return $this->hasOne('App\User', 'id', 'assign_id');
    }

    public function ports() {
        if ($this->port_status) {
            return json_decode($this->port_status);
        }
        return $this->driver->defaultPorts();
    }
    
    public function blocks() {
        return $this->driver->defaultBlocks();
    }

    public function datahistorys() {
        return $this->hasMany('App\DeviceDataHistory', 'device_id', 'id');
    }

    public function controlhistorys() {
        return $this->hasMany('App\ControlHistory', 'device_id', 'id');
    }

    public static function getDevices() {
        $devices = \App\Device::query()
                ->select('device.*')
                ->where('device.user_id', '=', Auth::user()->id)
                ->orWhere('device.assign_id', '=', Auth::user()->id);
        return $devices;
    }

}
