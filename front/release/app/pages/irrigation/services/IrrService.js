(function () {
    'use strict';
    angular
            .module('BlurAdmin')
            .factory('IrrService', IrrService);

    function IrrService($http) {
        var service = {};

        service.loadData = loadData;
        service.save = save;
        service.remove = remove;
        service.detail = detail;

        return service;

        function loadData(params, callback) {
            $http.get(constAcl.API_URL + '/api/irrigation', params)
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        console.log(error);
                        callback(false, error, status);
                    });
        }

        function save(params, callback) {
            $http.post(constAcl.API_URL + '/api/irrigation', params)
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        console.log(error);
                        callback(false, error, status);
                    });
        }

        function remove(id, callback) {
            $http.delete(constAcl.API_URL + '/api/irrigation/' + id)
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        console.log(error);
                        callback(false, error, status);
                    });
        }

        function detail(id, params, callback) {
            $http.get(constAcl.API_URL + '/api/irrigation/' + id, params)
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