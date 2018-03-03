<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputArgument;
use \Carbon\Carbon;
use Log;
use DB;
use BinSoul\Net\Mqtt\Client\React\ReactMqttClient;
use BinSoul\Net\Mqtt\Connection;
use BinSoul\Net\Mqtt\DefaultMessage;
use BinSoul\Net\Mqtt\DefaultSubscription;
use BinSoul\Net\Mqtt\Message;
use BinSoul\Net\Mqtt\Subscription;
use React\SocketClient\DnsConnector;
use React\SocketClient\TcpConnector;
use BinSoul\Net\Mqtt\DefaultConnection;

class MqttclientCommand extends Command {

    /**
     * The console command name.
     *
     * @var string
     */
    protected $name = 'mqttclient';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description.';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct() {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function fire() {
        //lấy tất cả running
        // Setup client
        $loop = \React\EventLoop\Factory::create();
        $dnsResolverFactory = new \React\Dns\Resolver\Factory();
        $connector = new DnsConnector(new TcpConnector($loop), $dnsResolverFactory->createCached('8.8.8.8', $loop));
        $client = new ReactMqttClient($connector, $loop);

        // Bind to events
        $client->on('open', function () use ($client) {
            // Network connection established
            echo sprintf("Open: %s:%s\n", $client->getHost(), $client->getPort());
        });

        $client->on('close', function () use ($client, $loop) {
            // Network connection closed
            echo sprintf("Close: %s:%s\n", $client->getHost(), $client->getPort());

            $loop->stop();
        });

        $client->on('connect', function (Connection $connection) {
            // Broker connected
            echo sprintf("Connect: client=%s\n", $connection->getClientID());
        });

        $client->on('disconnect', function (Connection $connection) {
            // Broker disconnected
            echo sprintf("Disconnect: client=%s\n", $connection->getClientID());
        });

        $client->on('message', function (Message $message) {
            // Incoming message
            if ($message->isDuplicate()) {
                return;
            }
            if ($message->isRetained()) {
                return;
            }
            if ($message->getPayload() == null || trim($message->getPayload()) == '') {
                return;
            }

//            echo ': ' . $message->getTopic() . ' => ' . mb_strimwidth($message->getPayload(), 0, 50, '...');
//            echo "\n";

            $topic = explode('/', $message->getTopic());
            $device_id = $topic[1];
            $device = \App\Device::where('code', '=', $device_id)->first();
            if ($device) {
//                $jsondata = $message->getPayload();
//                $data = "";
//                var_dump($jsondata);
//                echo "\n";
//                var_dump("json_decode: ");
//                echo "\n";
//                var_dump(json_decode((string) $jsondata));
//                echo "\n";
////                echo "\n";
//                $data = json_decode($jsondata);
//                var_dump("data: ");
//                var_dump($data->data);
//                echo "\n";
                echo "device: " . $device_id . " - " . $device->port_status;
                echo "\n";
//                
//                $arrRelay = explode(',', $data->data);
//                $device->update(['port_status' => json_encode($arrRelay)]);
////                        . " - data: " . $data;
////                echo "\n";

                $device->driver->onSubcriber($message, $device);
            }
        });

        $client->on('warning', function (\Exception $e) {
            echo sprintf("Warning: %s\n", $e->getMessage());
        });

        $client->on('error', function (\Exception $e) use ($loop) {
            echo sprintf("Error: %s\n", $e->getMessage());

            $loop->stop();
        });

        $user = \App\Config::where('key', '=', 'MQTTUSER')->first()->value;
        $pass = \App\Config::where('key', '=', 'MQTTPASS')->first()->value;
        // Connect to broker
        $client->connect('127.0.0.1', 1883, new DefaultConnection($user, $pass))->then(
                function () use ($client) {
            // Subscribe to all topics
            $client->subscribe(new DefaultSubscription('#'))
                    ->then(function (Subscription $subscription) {
                        echo sprintf("Subscribe: %s\n", $subscription->getFilter());
                    })
                    ->otherwise(function (\Exception $e) {
                        echo sprintf("Error: %s\n", $e->getMessage());
                    });
        }
        );


        $loop->run();
    }

    /**
     * Get the console command arguments.
     *
     * @return array
     */
    protected function getArguments() {
        return [
        ];
    }

    /**
     * Get the console command options.
     *
     * @return array
     */
    protected function getOptions() {
        return [
        ];
    }

}
