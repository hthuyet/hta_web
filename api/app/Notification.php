<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Notification extends Model {

    protected $table = 'notification';
    public $timestamps = true;

    protected $fillable = ['title','content','user_id','type','created_at'];
    public function usernotifications() {
        return $this->hasMany('App\UserNotification', 'notification_id', 'id');
    }
}
