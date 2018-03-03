<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Auth;

class Schedule extends Model {

    protected $table = 'schedule';
    public $timestamps = true;

    const STATUS_RUNNING = 1;
    const STATUS_DONE = 2;
    const STATUS_STOP = 3;

    protected $fillable = ['type', 'content', 'status', 'device_id', 'count', 'command', 'from', 'to', 'is_start', 'start_time', 'topic','serial','description'];

    public function device() {
        return $this->hasOne('App\Device', 'id', 'device_id');
    }

    public function ports() {
        $command = json_decode($this->command);
        return explode(',', $command->data);
    }

}
