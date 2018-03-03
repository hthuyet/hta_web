<?php

namespace App\Driver;

use BinSoul\Net\Mqtt\Message;
use Illuminate\Database\Eloquent\Model;
use Log;

class HTA1 extends ControlDriver {

    //ThuyetLV Add
    const CMD_TYPE_SCHEDULE_STATE = 1;
    const CMD_TYPE_CONTROL_RELAY = 2;
    const CMD_TYPE_CONTROL_AUTO = 3;
    const CMD_TYPE_CONFIG_NETWORK = 4;
    const CMD_TYPE_CONFIG_ID = 5;
    const CMD_TYPE_REQUEST_STATE = 6;
    const CMD_TYPE_CONFIG = 7;

    public function buildControlCommand($data, $type = 1) {
        $ports = $data['ports'];
        $time = null;
        $timeArray = [0, 0, 0, 0];
        $relayData = [2, 2, 2, 2];
        if (array_key_exists('time', $data)) {
            $time = $data['time'];
        }
        foreach ($ports as $key => $aPort) {
            $relayData[$aPort - 1] = $type;
            $timeArray[$aPort - 1] = $time[$key];
        }
        $timeStr = "";
        if (array_key_exists('time', $data)) {
            $timeStr = join('","', $timeArray);
        }
        $data = join(',', $relayData);
        if ($timeStr) {
            $command = '{ "uid": "' . $this->device->code . '", "cmd": "2", "data": "' . $data . '", "time": ["' . $timeStr . '"] }';
        } else {
            $command = '{ "uid": "' . $this->device->code . '", "cmd": "2", "data": "' . $data . '" }';
        }

        return $command;
    }

    //Tao mo ta cho ControlCommand
    public function createDesCrlCmd($data, $type = 1) {
        $description = "";
        try {
            $times = array();
            $ports = array();
            if (array_key_exists('time', $data)) {
                $times = $data['time'];
            }
            if (array_key_exists('ports', $data)) {
                $ports = $data['ports'];
            }

            if ($type == 0 || $type == "0") {
                //Tat
                foreach ($ports as $key => $port) {
                    $description .= "Tắt relay " . $port . " trong " . $times[$key] . " (s) <br />";
                }
            } else if ($type == 1 || $type == "1") {
                //Bat
                foreach ($ports as $key => $port) {
                    $description .= "Bật relay " . $port . " trong " . $times[$key] . " (s) <br />";
                }
            } else {
                //Khong thay doi
            }
        } catch (Exception $e) {
            Log::error("ERROR createDesCrlCmd: ", $e);
        }
        return $description;
    }

    public function buildCmdControl($relay, $time, $type = 1) {
        $relay = $relay - 1; //Relay truyen vao 1 thi index trong mang la 0
        $lstRelay = $this->defaultPorts();

        $data = array();
        $timeArr = array();
        foreach ($lstRelay as $key => $item) {
            if ($key == $relay) {
                $data[] = $type;
                $timeArr[] = $time;
            } else {
                $data[] = 2;
                $timeArr[] = "0";
            }
        }

        return '{ "uid": "' . $this->device->code . '", "cmd": "2", "data": "' . join(',', $data) . '", "time": ["' . join(',', $timeArr) . '"] }';
    }

    //Tao mo ta cho lenh tuoi
    public function createDesCmdControl($relay, $time, $type = 1) {
        $description = "";
        try {
            if ($type == 0 || $type == "0") {
                //Bat relay
                $description .= "Tắt relay " . $relay . " trong " . $time . " (s) <br />";
            } else if ($type == 1 || $type == "1") {
                //Tat relay
                $description .= "Bật relay " . $relay . " trong " . $time . " (s) <br />";
            }
        } catch (Exception $e) {
            Log::error("ERROR createDesCmdControl: ", $e);
        }
        return $description;
    }

//    public function onSubcriber(Message $message) {
//        $topic = explode('/', $message->getTopic());
//        $device_code = $topic[0];
//        $device_id = $topic[1];
//        $device_io = $topic[2];
//        try {
//            if (strcasecmp($device_io, 'IN') == 0) {
//                return;
//            }
//            $jsondata = $message->getPayload();
//            $data = json_decode($jsondata);
//            Log::info("---------------onSubcriber: {device_code: " . $device_code . ", device_id: " . $device_id . ", device_io: " . $device_io . "}, message->getPayload: " . $jsondata);
//            if (!$data) {
//                return;
//            }
//            if ($data->cmd == 1) {
//                return;
//            }
//            $arrRelay = explode(',', $data->data);
//            $device = \App\Device::where('code', '=', $device_id)->first();
//            $device->update(['port_status' => json_encode($arrRelay)]);
//            \App\DeviceDataHistory::create(['device_id' => $device_id, 'port_status' => $arrRelay]);
//        } catch (\Exception $e) {
//            Log::error($e);
//        }
//    }

    private function updatePorts($device, $port) {
        if ($device) {
            $arrRelay = array();
            if ($port) {
                $arrRelay = explode(',', $port);
            }
            $portStatus = json_encode($arrRelay);

            if ($device->port_status != $portStatus) {
                Log::info("---------------update port_status device_id: " . $device->id . " from: " . $device->port_status . " -> to: " . $portStatus);
                $device->update(['port_status' => json_encode($arrRelay)]);
                \App\DeviceDataHistory::create(['device_id' => $device->id, 'port_status' => $arrRelay]);
            }
        }
    }

    public function onSubcriber(Message $message, $device = null) {
        Log::info("onSubcriber getPayload: " . $message->getTopic() . " -> " . $message->getPayload());
        $topic = explode('/', $message->getTopic());
        $device_code = $topic[0];
        $device_id = $topic[1];
        $device_io = $topic[2];
        try {
            if (strcasecmp($device_io, 'IN') == 0) {
                //ThuyetLV
                $jsondata = $message->getPayload();
                $data = json_decode($jsondata);
                if (!$data) {
                    return;
                }
                if ($data->cmd == 1 || $data->cmd == 6) {
                    $this->updatePorts($device, $data->data);
                    return;
                }
                $device = \App\Device::where('code', '=', $device_id)->first();
            } else {
                //Code cu
                $jsondata = $message->getPayload();
                $data = json_decode($jsondata);
                if (!$data) {
                    return;
                }
                if ($data->cmd == 1 || $data->cmd == 3 || $data->cmd == 6) {
                    return;
                }
                $arrRelay = explode(',', $data->data);
                $device = \App\Device::where('code', '=', $device_id)->first();
                Log::info("---------------onSubcriber update port_status device_id: " . $device->id . " -> arrRelay: " . json_encode($arrRelay));
                $device->update(['port_status' => json_encode($arrRelay)]);
                \App\DeviceDataHistory::create(['device_id' => $device_id, 'port_status' => $arrRelay]);
            }
        } catch (\Exception $e) {
            Log::error($e);
        }
    }

    public function buildDeviceScheduleCommand($relay, $blockes) {
        $command = "";
        if ($blockes) {
            $command .= "{";
            $command .= ' "uid": "' . $this->device->code . '"';
            $command .= ', "cmd": "3"';
            $command .= ', "data": "' . $relay . '"';
            foreach ($blockes as $key => $item) {
                $command .= ', "' . $key . '": ["' . $item[0] . '","' . $item[1] . '","' . $item[2] . '"]';
            }
            $command .= ', "reserve": "1"';
            $command .= "}";
        }
        return $command;
    }

    //Tao mo ta cho lenh lich tbi
    public function buildDeviceScheduleDes($relay, $blockes, $times) {
        $description = "";
        try {
            $description = "Đặt lịch cho Relay: " . $relay . "<br />";
            $idx = 0;
            foreach ($blockes as $key => $item) {
                if ($item[0] == 1 || $item[0] == "1") {
                    $description.= "Block " . ($idx + 1) . " bắt đầu từ " . $times[$idx] . " trong " . $item[2] . " (s) <br/>";
                }
                $idx++;
            }
        } catch (Exception $e) {
            Log::error("ERROR buildDeviceScheduleDes: ", $e);
        }
        return $description;
    }

    public function defaultPorts() {
        return [0, 0, 0, 0];
    }

    public function defaultBlocks() {
        return [0, 0, 0, 0, 0, 0, 0, 0];
    }

    public function mqttin() {
        return 'HTAE1/' . $this->device->code . '/IN';
    }

    public function mqttout() {
        return 'HTAE1/' . $this->device->code . '/OUT';
    }

    public function canTimer() {
        return true;
    }

    public function buildCmdGetStatus() {
        $command = "{";
        $command .= ' "uid": "' . $this->device->code . '"';
        $command .= ', "cmd": "6"';
        $command .= ', "data": ""';
        $command .= "}";
        return $command;
    }

}
