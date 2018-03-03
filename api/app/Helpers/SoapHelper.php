<?php

namespace App\Helpers;

use Artisaninweb\SoapWrapper\Facades\SoapWrapper;

class SoapHelper {

    static $URL = 'http://127.0.0.1:9015/smartagri?wsdl';
    static $SERVICE_NAME = 'wsSendCommand';
    static $TYPE_HIS_CONTROL = "1";
    static $TYPE_HIS_SCHE_DEVICE = "3";
    static $TYPE_CONTROL = "2";
    static $TYPE_CONFIG_MODE = "3";

//    public static function sendCommand(
//    $device = "123456", $topic = "HTAE1/123456/OUT", $type = "2", $typeHis = "1", $data = '{"uid": "123456", "cmd": "2", "data": "1,1,2,2", "time": ["100","200","0","0"]}') {
    public static function sendCommand(
    $device = "123456", $topic = "HTAE1/123456/OUT", $type = "6", $typeHis = "1", $data = '{"uid": "123456", "cmd": "6", "data": ""}', $description = "") {
        try {
            // Add a new service to the wrapper
            SoapWrapper::add(function ($service) {
                $service
                        ->name(SoapHelper::$SERVICE_NAME)
                        ->wsdl(SoapHelper::$URL)
                        ->trace(true)
                        ->options(array("exceptions" => true))
                        ->cache(WSDL_CACHE_NONE);
            });
            $dataReq = [
                'device' => $device,
                'topic' => $topic,
                'type' => $type,
                'typeHis' => $typeHis,
                'data' => $data,
                'description' => $description,
            ];
            $response = new \stdClass();
            // Using the added service
            SoapWrapper::service(SoapHelper::$SERVICE_NAME, function ($service) use ($dataReq, $response) {
                $response->call = $service->call('sendCommand', [$dataReq]);
            });
            return $response->call;
        } catch (Exception $e) {
            die("asdfasf");
            throw new NotFoundHttpException();
        }
    }

    public static function deleteDevice($id = 1, $device = "123456") {
        try {
            // Add a new service to the wrapper
            SoapWrapper::add(function ($service) {
                $service
                        ->name(SoapHelper::$SERVICE_NAME)
                        ->wsdl(SoapHelper::$URL)
                        ->trace(true)
                        ->options(array("exceptions" => true))
                        ->cache(WSDL_CACHE_NONE);
            });
            $dataReq = [
                'id' => $id,
                'code' => $device,
            ];
            $response = new \stdClass();
            // Using the added service
            SoapWrapper::service(SoapHelper::$SERVICE_NAME, function ($service) use ($dataReq, $response) {
                $response->call = $service->call('deleteDevice', [$dataReq]);
            });
            return $response->call;
        } catch (Exception $e) {
            die("asdfasf");
            throw new NotFoundHttpException();
        }
    }

    public function callMethod($metodo, $request) {
        // Add a new service to the wrapper
        SoapWrapper::add(function ($service) {
            $service
                    ->name(SoapHelper::$SERVICE_NAME)
                    ->wsdl(SoapHelper::$URL)
                    ->trace(true);
        });

        $request = (array) $request;
        $response = new stdClass();
        SoapWrapper::service(SoapHelper::$SERVICE_NAME, function ($service) use($metodo, $request, $response) {
            $response->call = $service->call($metodo, [$request]);
        });
        return $response->call;
    }

}
