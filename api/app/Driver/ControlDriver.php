<?php

namespace App\Driver;

use BinSoul\Net\Mqtt\Message;
use BinSoul\Net\Mqtt\Client\React\ReactMqttClient;
use BinSoul\Net\Mqtt\Connection;
use BinSoul\Net\Mqtt\DefaultMessage;
use BinSoul\Net\Mqtt\DefaultSubscription;
use BinSoul\Net\Mqtt\Subscription;
use React\SocketClient\DnsConnector;
use React\SocketClient\TcpConnector;
use BinSoul\Net\Mqtt\DefaultConnection;
use Log;

/**
 * Represents a subscription.
 */
abstract class ControlDriver {

    protected $device;

    abstract function mqttout();

    abstract function mqttin();

    public function __construct($device) {
        $this->device = $device;
    }

    abstract function defaultPorts();

    abstract function canTimer();

    abstract function onSubcriber(Message $message);

    abstract function buildControlCommand($data, $type = 1);

    abstract function buildDeviceScheduleCommand($relay, $blockes);

    public function writeLog($topic, $content) {
        try {
            $path = dirname(__FILE__) . "/../../storage/" . str_replace("/", "_", $topic);
            $myfile = fopen($path, "a") or die("Unable to open file!");
            fwrite($myfile, "\n" . $content);
            fclose($myfile);
        } catch (Exception $e) {
            
        }
    }

    public function sendCommand($command, $type = 1) {
        $topic = $this->mqttout();
        $topic2 = explode('/', $topic);
        $device_id = $topic2[1];
        \App\DeviceControlHistory::create(['code' => $device_id, 'command' => $command, 'type' => $type]);

        Log::info("------------command: " . $command . " => topic: " . $topic);

        $this->writeLog($topic, $command);
        // Setup client
        $loop = \React\EventLoop\Factory::create();
        $dnsResolverFactory = new \React\Dns\Resolver\Factory();
        $connector = new DnsConnector(new TcpConnector($loop), $dnsResolverFactory->createCached('8.8.8.8', $loop));
        $client = new ReactMqttClient($connector, $loop);

        $client->on('close', function () use ($client, $loop) {
            $loop->stop();
        });
        $client->on('error', function (\Exception $e) use ($loop, $topic) {
            $this->writeLog($topic, "\tError client: " . $e->getMessage());
            Log::error("Error: " . $e->getMessage());
            echo sprintf("Error: %s\n", $e->getMessage());
            $loop->stop();
        });

        $client->on('message', function (Message $message) use ($topic) {
            // Incoming message
            echo 'Message';

            if ($message->isDuplicate()) {
                $this->writeLog($topic, "\tduplicate");
                echo ' (duplicate)';
            }

            if ($message->isRetained()) {
                $this->writeLog($topic, "\tretained");
                echo ' (retained)';
            }
            Log::info("sendCommand message: " . $message->getTopic() . " => " . mb_strimwidth($message->getPayload(), 0, 50, '...'));
            $this->writeLog($topic, "\tMessage client (" . date('Y-m-d H:i:s') . "): " . $message->getTopic() . ' => ' . mb_strimwidth($message->getPayload(), 0, 50, '...'));
            echo ': ' . $message->getTopic() . ' => ' . mb_strimwidth($message->getPayload(), 0, 50, '...');
            echo "\n";
        });

        $user = \App\Config::where('key', '=', 'MQTTUSER')->first()->value;
        $pass = \App\Config::where('key', '=', 'MQTTPASS')->first()->value;
        // Connect to broker
//        $client->connect('118.70.233.43', 1883, new DefaultConnection($user, $pass))->then(
        $client->connect('127.0.0.1', 1883, new DefaultConnection($user, $pass))->then(
                function () use ($client, $loop, $topic, $command) {
            // Subscribe to all topics
            $client->publish(new DefaultMessage($topic, $command))
                    ->then(function (Message $message)use ($topic, $command) {
                        $this->writeLog($topic, "\tPublish: " . $message->getTopic() . " => " . $message->getPayload());
                        echo sprintf("Publish: %s => %s\n", $message->getTopic(), $message->getPayload());
                    })
                    ->otherwise(function (\Exception $e)use ($topic, $command) {
                        $this->writeLog($topic, "\tError Publish: " . $e->getMessage());
                        Log::info("Error Publish: " . $e->getMessage());
                        echo sprintf("Error: %s\n", $e->getMessage());
                    });
            $loop->stop();
        }
        );

        $loop->run();
    }

    public function receiveResponse() {
        $topic = $this->mqttin();
        $topic2 = explode('/', $topic);
        $device_id = $topic2[1];

        // Setup client
        $loop = \React\EventLoop\Factory::create();
        $dnsResolverFactory = new \React\Dns\Resolver\Factory();
        $connector = new DnsConnector(new TcpConnector($loop), $dnsResolverFactory->createCached('8.8.8.8', $loop));
        $client = new ReactMqttClient($connector, $loop);

        $this->writeLog($topic, "receiveResponse");

        $client->on('close', function () use ($client, $loop) {
            $loop->stop();
        });

        $client->on('error', function (\Exception $e) use ($loop, $topic) {
            die("error");
            $this->writeLog($topic, "\tError client: " . $e->getMessage());
            Log::error("Error: " . $e->getMessage());
            echo sprintf("Error: %s\n", $e->getMessage());
            $loop->stop();
        });

        $client->on('message', function (Message $message) use ($loop, $topic) {
            // Incoming message
            echo 'Message';

            if ($message->isDuplicate()) {
                $this->writeLog($topic, "\tduplicate");
                echo ' (duplicate)';
            }

            if ($message->isRetained()) {
                $this->writeLog($topic, "\tretained");
                echo ' (retained)';
            }
            $this->writeLog($topic, "\tMessage client (" . date('Y-m-d H:i:s') . "): " . $message->getTopic() . ' => ' . mb_strimwidth($message->getPayload(), 0, 50, '...'));
            Log::info("receiveResponse message: " . $message->getTopic() . " => " . mb_strimwidth($message->getPayload(), 0, 50, '...'));
            echo ': ' . $message->getTopic() . ' => ' . mb_strimwidth($message->getPayload(), 0, 50, '...');
            echo "\n";
            $loop.stop();
        });

        $user = \App\Config::where('key', '=', 'MQTTUSER')->first()->value;
        $pass = \App\Config::where('key', '=', 'MQTTPASS')->first()->value;
        // Connect to broker
//        $client->connect('118.70.233.43', 1883, new DefaultConnection($user, $pass))->then(
        $client->connect('127.0.0.1', 1883, new DefaultConnection($user, $pass))->then(
                function () use ($client, $loop, $topic) {
            // Subscribe to all topics
            $client->subscribe(new DefaultSubscription($topic))
                    ->then(function (Subscription $subscription) {
//                            $this->writeLog($topic, "\tSubscribe: " . $subscription->getFilter());
                    })
                    ->otherwise(function (\Exception $e) {
                        echo sprintf("Error: %s\n", $e->getMessage());
                    });
        }
        );
        Log::info("------receiveResponse Done: ");

        $loop->run();
    }

}
