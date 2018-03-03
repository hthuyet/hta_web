<?php

namespace App;

use Jenssegers\Mongodb\Eloquent\Model as Model;

class DeviceControlHistory extends Model {

    protected $connection = 'mongodb';
    protected $collection = 'device_control_history';
    protected $fillable = ['code', 'command', 'type'];

    public function ports() {

        $newCommand = json_decode($this->command);
        if (!$newCommand || !$newCommand->data) {
            return array();
        }
        $arrRelay = explode(',', $newCommand->data);
        foreach ($arrRelay as $key => $aRelay) {
            if ($aRelay == 2) {
                continue;
            }
            $arrRelay[$key] = ($aRelay) ? '1' : '0';
        }
        return $arrRelay;
    }

}
