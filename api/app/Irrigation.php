<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Auth;

class Irrigation extends Model {

    protected $table = 'irrigation';
    public $timestamps = true;
    
    const STATUS_OFF = 0;
    const STATUS_ON = 1;
    
    protected $fillable = ['area_name','code','user_id','created_at','updated_at','status','from_date','to_date'];
    

    public function creator() {
        return $this->hasOne('App\User', 'id', 'user_id');
    }
    
    public function irrigationdetails() {
        return $this->hasMany('App\IrrigationDetail', 'irrigation_id', 'id');
    }
    
    
    public static function getIrrigations(){
        $irrigations = \App\Irrigation::query()
                    ->select('irrigation.*')
                ->where('irrigation.user_id','=',Auth::user()->id);
        return $irrigations;
    }
}
