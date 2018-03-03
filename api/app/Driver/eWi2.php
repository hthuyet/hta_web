<?php

namespace App\Driver;

use BinSoul\Net\Mqtt\Message;
use Illuminate\Database\Eloquent\Model;
use Log;
use Symfony\Component\Console\Input\InputArgument;
use \Carbon\Carbon;

class eWi2 extends ControlDriver {

    public function defaultPorts() {
        return [0, 0, 0, 0, 0, 0];
    }

    public function buildControlCommand($data, $type = 1) {
        $ports = $data['ports'];
        $relayData = [2, 2, 2, 2, 2, 2];
        foreach ($ports as $aPort) {
            $relayData[$aPort - 1] = $type;
        }
        $data = join(',', $relayData);
        $command = '{"cmd":{"id":"1234","type":"2"}, "data":"' . $data . '"}';
        return $command;
    }

    public function buildCmdControl($relay, $time, $type = 1) {
        $relay = $relay - 1; //Relay truyen vao 1 thi index trong mang la 0
        $lstRelay = $this->defaultPorts();
        $data = array();
        foreach ($lstRelay as $key => $item) {
            if ($key == $relay) {
                $data[] = $type;
            } else {
                $data[] = 2;
            }
        }
        return '{"cmd":{"id":"1234","type":"2"}, "data":"' . join(',', $data) . '"}';
    }

    //Tao mo ta cho ControlCommand
    public function createDesCrlCmd($data, $type = 1) {
        $description = "";
        try {
            $ports = array();
            if (array_key_exists('ports', $data)) {
                $ports = $data['ports'];
            }

            if ($type == 0 || $type == "0") {
                //Tat
                foreach ($ports as $key => $port) {
                    $description .= "Tắt relay " . $port . " <br />";
                }
            } else if ($type == 1 || $type == "1") {
                //Bat
                foreach ($ports as $key => $port) {
                    $description .= "Bật role " . $port . " <br />";
                }
            } else {
                //Khong thay doi
            }
        } catch (Exception $e) {
            Log::error("ERROR createDesCrlCmd: ", $e);
        }
        return $description;
    }

    public function buildDeviceScheduleCommand($relay, $blockes) {
        foreach ($blockes as &$block) {
            if ($block[0] == "1" && isset($block[1])) {
                $startTime = Carbon::createFromFormat("His", $block[1]);
                $startTime->addSeconds($block[2]);
                array_push($block, $startTime->format("His"));
            } else {
                array_push($block, "");
            }
        }
        $command = "";
        if ($blockes) {
            $command .= "{";
            $command .= ' "cmd": { "id": "' . $this->device->code . '", "type": "3"}';
            $command .= ', "data": "' . $relay . '';
            $command .= ', 1';  //mode
            $command .= ', 0'; //reserve
            foreach ($blockes as $key => $item) {
                if ($item[0] == "1" && isset($item[1])) {
                    $command .= ', ' . $item[0] . $item[1] . $item[3] . '';
                } else {
                    $command .= ', ' . $item[0] . '000000000001';
                }
            }
            $command.= "\"";
            $command .= "}";
        }
        return $command;
    }

    public function onSubcriber(Message $message) {
        $topic = explode('/', $message->getTopic());
        $device_code = $topic[0];
        $device_id = $topic[1];
        $device_io = $topic[2];
        try {
            if (strcasecmp($device_io, 'OUT') == 0) {
                return;
            }
            $jsondata = $message->getPayload();
            $data = json_decode($jsondata);
            if (!$data) {
                return;
            }
            if ($data->cmd->id == 1235 && $data->cmd->type == 3) {
                return;
            }
            $arrRelay = explode(',', $data->data);
            $device = \App\Device::where('code', '=', $device_id)->first();
            $device->update(['port_status' => json_encode($arrRelay)]);
            \App\DeviceDataHistory::create(['device_id' => $device_id, 'port_status' => $arrRelay]);
        } catch (\Exception $e) {
            Log::error($e);
        }
    }

    public function mqttin() {
        return 'eWi2/' . $this->device->code . '/in';
    }

    public function mqttout() {
        return 'eWi2/' . $this->device->code . '/out';
    }

    public function canTimer() {
        return false;
    }

    public function defaultBlocks() {
        return [0, 0, 0, 0, 0];
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
                $description .= "Bật role " . $relay . " trong " . $time . " (s) <br />";
            }
        } catch (Exception $e) {
            Log::error("ERROR createDesCmdControl: ", $e);
        }
        return $description;
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
}
