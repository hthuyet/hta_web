(function () {
    'use strict';
    angular
            .module('BlurAdmin')
            .factory('UserService', UserService);

    function UserService($http) {
        var service = {};

        service.loadData = loadData;
        service.save = save;
        service.remove = remove;
        service.get = get;
        service.update = update;

        return service;

        function loadData(params, callback) {
            $http.get(constAcl.API_URL + '/api/user', params)
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        console.log(error);
                        callback(false, error, status);
                    });
        }

        function save(params, callback) {
            $http.post(constAcl.API_URL + '/api/user', params)
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        console.log(error);
                        callback(false, error, status);
                    });
        }

        function remove(id, callback) {
            $http.delete(constAcl.API_URL + '/api/user/' + id)
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        console.log(error);
                        callback(false, error, status);
                    });
        }

        function get(callback) {
            $http.get(constAcl.API_URL + '/api/user/me')
                    .success(function (response) {
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        callback(false, error, status);
                    });

        }

        function update(params, callback) {
            $http.post(constAcl.API_URL + '/api/user/update', params)
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