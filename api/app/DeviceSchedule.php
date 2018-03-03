<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Auth;

class DeviceSchedule extends Model {

    protected $table = 'device_schedule';
    public $timestamps = true;

    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    protected $appends = ['driver'];
    protected $fillable = ['device_id', 'serial', 'relay', 'data', 'topic', 'command', 'description'];

    public function device() {
        return $this->hasOne('App\Device', 'id', 'device_id');
    }

    public static function getDeviceSchedule($deviceId) {
        $devices = \App\DeviceSchedule::query()
                ->select('device_schedule.*')
                ->where('device_schedule.device_id', '=', $deviceId)
                ->orderBy('device_schedule.created_at', 'desc');
        return $devices;
    }

}
