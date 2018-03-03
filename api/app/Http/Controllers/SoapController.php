<?php

namespace App\Http\Controllers;

use App\Helpers\SoapHelper;
use Illuminate\Http\Request;
use \Illuminate\Support\Facades\Session;

class SoapController extends Controller {

    public function demo() {
        $responseWs = SoapHelper::sendCommand();
        var_dump($responseWs);
    }

}
