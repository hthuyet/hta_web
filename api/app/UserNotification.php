<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserNotification extends Model {

    protected $table = 'user_notification';
    public $timestamps = false;

    protected $fillable = ['notification_id','is_read','user_id'];
}
