(function () {
    'use strict';
    angular
            .module('BlurAdmin')
            .factory('DeviceService', DeviceService);

    function DeviceService($http) {
        var service = {};

        service.loadData = loadData;
        service.save = save;
        service.remove = remove;
        service.getPortStatus = getPortStatus;
        service.control = control;
        service.listScheduleDevice = listScheduleDevice;
        service.scheduleDevice = scheduleDevice;
        service.listScheduleServer = listScheduleServer;
        service.scheduleServer = scheduleServer;
        service.deleteServer = deleteScheduleServer;
        service.history = history;
        service.portInfo = portInfo;
        service.savePortInfo = savePortInfo;
        service.statics = statics;

        return service;

        function loadData(params, callback) {
            $http.get(constAcl.API_URL + '/api/device', params)
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        console.log(error);
                        callback(false, error, status);
                    });
        }

        function save(params, callback) {
            $http.post(constAcl.API_URL + '/api/device', params)
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        console.log(error);
                        callback(false, error, status);
                    });
        }

        function remove(id, callback) {
            $http.delete(constAcl.API_URL + '/api/device/' + id)
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        console.log(error);
                        callback(false, error, status);
                    });
        }

        function getPortStatus(id, callback) {
            $http.get(constAcl.API_URL + '/api/device/control/' + id)
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        callback(false, error, status);
                    });
        }

        function control(params, callback) {
            $http.post(constAcl.API_URL + '/api/device/control', params)
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        callback(false, error, status);
                    });
        }

        function listScheduleDevice(device, params, callback) {
            $http.get(constAcl.API_URL + '/api/device/schedule/' + device, params)
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        console.log(error);
                        callback(false, error, status);
                    });
        }
        function scheduleDevice(device, params, callback) {
            $http.post(constAcl.API_URL + '/api/device/schedule/' + device, params)
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        console.log(error);
                        callback(false, error, status);
                    });
        }
        function listScheduleServer(params, callback) {
            $http.get(constAcl.API_URL + '/api/server/schedule', params)
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        callback(false, error, status);
                    });
        }
        function scheduleServer(params, callback) {
            $http.post(constAcl.API_URL + '/api/server/schedule', params)
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        callback(false, error, status);
                    });
        }
        function deleteScheduleServer(id, callback) {
            $http.delete(constAcl.API_URL + '/api/server/schedule/' + id)
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        callback(false, error, status);
                    });
        }

        function history(device, params, callback) {
            $http.get(constAcl.API_URL + '/api/device/history/' + device, params)
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        callback(false, error, status);
                    });
        }

        function portInfo(device, callback) {
            $http.get(constAcl.API_URL + '/api/device/port/' + device)
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        callback(false, error, status);
                    });
        }

        function savePortInfo(device, params, callback) {
            $http.post(constAcl.API_URL + '/api/device/port/' + device, params)
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        console.log(error);
                        callback(false, error, status);
                    });
        }
        
        function statics(callback) {
            $http.get(constAcl.API_URL + '/api/device/statics')
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        console.log(error);
                        callback(false, error, status);
                    });
        }
    }
})();