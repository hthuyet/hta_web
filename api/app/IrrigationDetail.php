<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Auth;

class IrrigationDetail extends Model {

    protected $table = 'irrigation_detail';
    public $timestamps = true;
    
    protected $fillable = ['step','is_start','count','irrigation_id','device_id','created_at','updated_at','condition','weight','from','to','time','port','topic','serial','command','command_off','description'];

    public function device() {
        return $this->hasOne('App\Device', 'id', 'device_id');
    }
    public function irrigation() {
        return $this->hasOne('App\Irrigation', 'id', 'irrigation_id');
    }
    
    
}
