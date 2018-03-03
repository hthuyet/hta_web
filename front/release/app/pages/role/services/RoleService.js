(function () {
    'use strict';
    angular
            .module('BlurAdmin')
            .factory('RoleService', RoleService);

    function RoleService($http) {
        var service = {};

        service.loadData = loadData;
        service.save = save;
        service.remove = remove;

        return service;

        function loadData(params, callback) {
            $http.get(constAcl.API_URL + '/api/role', params)
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        console.log(error);
                        callback(false, error, status);
                    });
        }

        function save(params, callback) {
            $http.post(constAcl.API_URL + '/api/role', params)
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        console.log(error);
                        callback(false, error, status);
                    });
        }

        function remove(id, callback) {
            $http.delete(constAcl.API_URL + '/api/role/' + id)
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