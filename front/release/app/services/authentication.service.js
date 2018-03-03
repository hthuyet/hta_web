(function () {
    'use strict';
    angular
            .module('BlurAdmin')
            .factory('AuthenticationService', AuthenticationService);

    function AuthenticationService($rootScope, $http, $localStorage, AclService) {
        var service = {};

        service.Login = Login;
        service.Logout = Logout;
        service.forgot = forgot;
        service.reset = reset;
        service.refresh = refresh;

        return service;

        function Login(username, password, callback) {
            console.log("-----Login authenticate--------");
            $http.get(constAcl.API_URL + '/api/listRole')
                    .success(function (response) {
                        console.log(response);
                        AclService.setAbilities(response.rtn);
                        $http.post(constAcl.API_URL + '/api/login', {email: username, password: password})
                                .success(function (response) {
                                    // login successful if there's a token in the response
                                    if (response.token) {
                                        try {
                                            AclService.flushRoles();
                                        } catch (c) {
                                            console.log(c);
                                        }
                                        AclService.attachRole(response.roleName);
                                        // store username and token in local storage to keep user logged in between page refreshes
                                        $localStorage.currentUser = {username: username, token: response.token};

                                        // add jwt token to auth header for all requests made by the $http service
                                        $http.defaults.headers.common.Authorization = 'Bearer ' + response.token;

                                        console.log(AclService.getRoles());
                                        // execute callback with true to indicate successful login
                                        callback(true, "", 200);
                                    } else {
                                        // execute callback with false to indicate failed login
                                        callback(false, "", 200);
                                    }
                                })
                                .error(function (error, status) {
                                    console.log(error);
                                    callback(false, error, status);
                                });
                    })
                    .error(function (error, status) {
                        console.log(error);
                    });

        }

        function Logout() {
            $http.get(constAcl.API_URL + '/api/logout')
                    .success(function (response) {
                        // logout successful
                        try {
                            AclService.flushStorage();
                        } catch (c) {
                            console.log(c);
                        }
                        delete $localStorage.currentUser;
                        $http.defaults.headers.common.Authorization = '';
                        $rootScope.$broadcast('auth-logout');
                    })
                    .error(function (error, status) {
                        try {
                            AclService.flushStorage();
                        } catch (c) {
                            console.log(c);
                        }
                        delete $localStorage.currentUser;
                        $http.defaults.headers.common.Authorization = '';
                        $rootScope.$broadcast('auth-logout');
                    });

        }

        function forgot(email, url, callback) {
            var encodedString = btoa(url);
            console.log(btoa("url"));
            $http.get(constAcl.API_URL + '/api/password/email/' + email + "?dXJs=" + encodedString)
                    .success(function (response) {
                        console.log(response);
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        console.log(error);
                        callback(false, error, status);
                    });

        }
        function reset(token, email, password, callback) {
            $http.post(constAcl.API_URL + '/api/password/reset', {token: token, email: email, password: password})
                    .success(function (response) {
                        console.log(response);
                        callback(true, response, 200);
                    })
                    .error(function (error, status) {
                        console.log(error);
                        callback(false, error, status);
                    });

        }

        function refresh(token, callback) {
            console.log("-----refresh token--------");
            $http.post(constAcl.API_URL + '/api/auth/refresh', {token: token})
                    .success(function (response) {
                        $rootScope.storeAuthToken(response.token);
                        if (callback) {
                            callback(true, response, 200);
                        }
                    })
                    .error(function (error, status) {
                        console.log(error);
                        $rootScope.deleteAuthToken();
                        if (callback) {
                            callback(false, error, status);
                        }
                    });

        }


    }
})();