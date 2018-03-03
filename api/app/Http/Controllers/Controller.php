<?php

namespace App\Http\Controllers;

use App\Http\Requests\Request;
use App\Notification;
use App\Order;
use App\Product;
use App\Reminder;
use App\Tranaction;
use App\UserNotification;
use Illuminate\Foundation\Bus\DispatchesCommands;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Support\Facades\Mail;
use App\User;
use View;
use Auth;
use DB;
use Input;
use Log;
use Session;

abstract class Controller extends BaseController {

    use DispatchesCommands,
        ValidatesRequests;

    public function __construct() {
        if (Auth::user()) {
            $notifications = \App\Notification::query()
                            ->join('user_notification', 'notification.id', '=', 'user_notification.notification_id')
                            ->where('user_notification.user_id', Auth::user()->id)
                            ->where('user_notification.is_read', false)
                            ->orderBy('notification.created_at', 'desc')->paginate(10);
            View::share('newnotifications', $notifications);
        }
    }

    /* Get Key trong bang config */

    public static function getConfigByKey($key) {
        $config = \App\Config::where('key', '=', $key)->first();
        if ($config == null) {
            return null;
        }
        return $config->value;
    }

    public static function checkPermissonDevice($device_id, $device = null, $route = "") {
        if (!$device) {
            $device = \App\Device::find($device_id);
        }
        if (!$device) {
            Log::info("device not fount: " . $device_id);
            if ($route) {
                Session::flash('error_message', 'Thiết bị không tồn tại hoặc không thuộc quản lý của bạn!');
                return redirect($route);
            }
            return false;
        }
        
        if (!Auth::user()->can('device-manager')) {
            if ($device->assign_id != Auth::user()->id && $device->user_id != Auth::user()->id) {
                Log::info("device not perms: " . $device_id . " assign_id: " . $device->assign_id . " user_id: " . $device->user_id . " Auth: " . Auth::user()->id);
                if ($route) {
                    Session::flash('error_message', 'Thiết bị không tồn tại hoặc không thuộc quản lý của bạn!');
                    return redirect($route);
                }
                return false;
            }
        }
        return true;
    }

}
