(function () {
    'use strict';
    angular
            .module('BlurAdmin')
            .factory('DeviceTypeService', DeviceService);

    function DeviceService($http) {
        var service = {};

        service.loadData = loadData;

        return service;

        function loadData(params, callback) {
            $http.get(constAcl.API_URL + '/api/deviceType', params)
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