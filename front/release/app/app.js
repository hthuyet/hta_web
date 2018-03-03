(function () {
    'use strict';
    angular.module('BlurAdmin', [
        'ngAnimate',
        'ui.bootstrap',
        'ui.sortable',
        'ui.router',
        'ngTouch',
        'toastr',
        'smart-table',
        "xeditable",
        'ui.slimscroll',
        'ngJsTree',
        'angular-progress-button-styles',
        'BlurAdmin.theme',
        'BlurAdmin.pages',
        'ngStorage',
        'angular-ladda',
        'mm.acl',
        'angular-loading-bar',
        'ngAnimate',
        'angularSpinner',
        'mwl.confirm',
        'angular-jwt',
        'ngWebsocket'
    ])
            .filter('propsFilter', function () {
                return function (items, props) {
                    var out = [];

                    if (angular.isArray(items)) {
                        var keys = Object.keys(props);

                        items.forEach(function (item) {
                            var itemMatches = false;

                            for (var i = 0; i < keys.length; i++) {
                                var prop = keys[i];
                                var text = props[prop].toLowerCase();
                                if (item[prop].toString().toLowerCase().indexOf(text) !== -1) {
                                    itemMatches = true;
                                    break;
                                }
                            }

                            if (itemMatches) {
                                out.push(item);
                            }
                        });
                    } else {
                        // Let the output be the input untouched
                        out = items;
                    }

                    return out;
                };
            })
            .filter('dateFormat', function ($filter) {
                return function (input) {
                    if (input == null) {
                        return "";
                    }
                    if (input == '0000-00-00') {
                        return "";
                    }
                    if (input == '0000-00-00 00:00:00') {
                        return "";
                    }
                    var _date = $filter('date')(new Date(input), 'dd/MM/yyyy');
                    return _date.toUpperCase();
                };
            })
            .filter('dateTimeFormat', function ($filter) {
                return function (input) {
                    if (input == null) {
                        return "";
                    }
                    if (input == '0000-00-00') {
                        return "";
                    }
                    if (input == '0000-00-00 00:00:00') {
                        return "";
                    }
                    var _date = $filter('date')(new Date(input), 'dd/MM/yyyy hh:mm:ss');
                    return _date.toUpperCase();
                };
            })

            .filter('cut', function () {
                return function (value, wordwise, max, tail) {
                    if (!value)
                        return '';

                    max = parseInt(max, 10);
                    if (!max)
                        return value;
                    if (value.length <= max)
                        return value;

                    value = value.substr(0, max);
                    if (wordwise) {
                        var lastspace = value.lastIndexOf(' ');
                        if (lastspace != -1) {
                            value = value.substr(0, lastspace);
                        }
                    }

                    return value + (tail || '...');
                };
            })

            //httpRequestInterceptor
            .factory('httpRequestInterceptor', function ($rootScope, $injector, $q, $localStorage, $location) {
                return {
                    request: function (config) {
//                        config.headers['Accept'] = 'application/json;odata=verbose';
//                        config.headers['Access-Control-Allow-Methods'] = 'GET, OPTIONS, DELETE, PUT';
//                        config.headers['Access-Control-Allow-Origin'] = '*';
//                        config.headers['Access-Control-Allow-Headers'] = 'X-Requested-With, Content-Type, Origin, Authorization, Accept, Client-Security-Token, Accept-Encoding';
                        return config;
                    },
                    response: function (response) {
                        return response || $q.when(response);
                    },
                    responseError: function (response) {
                        var stateService = $injector.get('$state');
                        console.log("------httpRequestInterceptor responseError-----");
                        console.log(response);
                        if (response.status === -1) {
                            //ERR_CONNECTION_RESET
                            console.log("-----ERR_CONNECTION_RESET------");
                            var $http = $injector.get('$http');
                            return $http(response.config);
                        } else if (response.status === 401) {
                            // We're going to get attempt to refresh the token on the
                            // server, if we're within the ttl_refresh period.
                            var deferred = $q.defer();
                            // We inject $http, otherwise we will get a circular ref
                            $injector.get('$http').post(constAcl.API_URL + '/api/token/refresh', {}, {
                                headers: {
                                    Authorization: 'Bearer ' + $localStorage.currentUser.token
                                }
                            }).then(function (response) {
                                // If this request was successful, we will have a new
                                // token, so let's put it in storage
                                $localStorage.currentUser.token = response.token;

                                // Now let's send the original request again
                                $injector.get('$http')(response.config)
                                        .then(function (response) {
                                            // The repeated request was successful! So let's put
                                            // this response back to the original workflow
                                            return deferred.resolve(response);
                                        }, function () {
                                            // Something went wrong with this request
                                            // So we reject the response and carry on with 401
                                            // error
                                            $rootScope.$broadcast('auth-logout');
                                            return deferred.reject();
                                        })
                            }, function () {
                                // Refreshing the token failed, so let's carry on with
                                // 401
                                $rootScope.$broadcast('auth-logout');
                                return deferred.reject();
                            });
                            // Now we continue with the 401 error if we've reached this
                            // point
                            return deferred.promise;

                        } else if (response.status === 303 || response.status === 401
                                || response.statusText == "Unauthorized"
                                || (response.data && response.data.message && response.data.message === 'Token has expired')) {
                            if (stateService.current.data && stateService.current.data.requireLogin !== "undefined" && stateService.current.data.requireLogin) {
                                $rootScope.error = response.data.message;
                                console.log(stateService.current.data);
                                delete $localStorage.currentUser;
                                try {
                                    $('.modal').modal('hide');
                                } catch (c) {
                                    console.log(c);
                                }
                                $location.path('/login');
                            }
                        }

                        return $q.reject(response);
                    }
                };
            })

            .config(config)
//            .config(function ($httpProvider) {
//                $httpProvider.defaults.headers.common = {};
//                $httpProvider.defaults.headers.post = {};
//                $httpProvider.defaults.headers.put = {};
//                $httpProvider.defaults.headers.patch = {};
//            })
            .config(configAcl)
            .config(configLoading)
            .run(refreshToken)
            .run(runMwlConfirm)
            .run(runAclTest)
            .run(runAcl)
            .run(runAclReject)
//            .run(runWebsocket)
            .factory('myWebsocket', myWebsocket)
            .run(run);

    function configLoading(cfpLoadingBarProvider) {
        cfpLoadingBarProvider.includeBar = true;
        cfpLoadingBarProvider.includeSpinner = false;
    }

    function config($stateProvider, $urlRouterProvider, $httpProvider) {
        // default route
        //$urlRouterProvider.otherwise("/");
        $urlRouterProvider.otherwise('/dashboard');

        //Add
        $httpProvider.interceptors.push('httpRequestInterceptor');

        // app routes
        $stateProvider
                .state('login', {
                    url: '/login',
                    templateUrl: '../app/pages/login/login.html',
                    controller: 'LoginController',
                    controllerAs: 'vm'
                })
                .state('forgotpass', {
                    url: '/quen-mat-khau',
                    templateUrl: '../app/pages/forgot/forgot.html',
                    controller: 'ForgotController',
                    controllerAs: 'vm'
                })
                .state('getforgotpass', {
                    url: '/quen-mat-khau/:token',
                    templateUrl: '../app/pages/forgot/reset.html',
                    controller: 'ResetController',
                    controllerAs: 'vm'
                });
    }

    function configAcl(AclServiceProvider) {
        var myConfig = {
            storage: 'localStorage',
            storageKey: 'AppAcl'
        };
        AclServiceProvider.config(myConfig);
        AclServiceProvider.resume();
    }

    function runAclTest($http, AclService) {
//        AclService.flushStorage();
//        console.log("---runAclTest-------");
//        // Set the ACL data. Normally, you'd fetch this from an API or something.
//        // The data should have the roles as the property names,
//        // with arrays listing their permissions as their value.
//        var aclData = {
//            guest: ['login'],
//            member: ['logout', constAcl.device_view],
//            admin: ['logout',
//                constAcl.device_view, constAcl.device_manage,
//                constAcl.user_view, constAcl.user_manage,
//            ]
//        }
//        AclService.setAbilities(aclData);

    }

    function runAcl(AclService, $http) {
//         Attempt to load from web storage
        console.log("AclService.resume(): " + AclService.resume());
        if (!AclService.resume()) {
            console.log("---runAcl resume-------");
            try {
                AclService.flushStorage();
            } catch (c) {
                console.log(c);
            }
            // Web storage record did not exist, we'll have to build it from scratch

            $http.get(constAcl.API_URL + '/api/listRole')
                    .success(function (response) {
                        console.log(response);
                        AclService.setAbilities(response.rtn);
                    })
                    .error(function (error, status) {
                        // Set the ACL data. Normally, you'd fetch this from an API or something.
                        // The data should have the roles as the property names,
                        // with arrays listing their permissions as their value.
                        var aclData = {
                            guest: ['login'],
                            member: ['logout', constAcl.device_view],
                            admin: ['logout',
                                constAcl.device_view, constAcl.device_manage,
                                constAcl.user_view, constAcl.user_manage,
                            ]
                        }
                        AclService.setAbilities(aclData);

                        // Attach the member role to the current user
//                    AclService.attachRole('member');
                        AclService.attachRole('admin');
                    });
//            // Get the user role, and add it to AclService
//            var userRole = fetchUserRoleFromSomewhere();
//            AclService.addRole(userRole);
//
//            // Get ACL data, and add it to AclService
//            var aclData = fetchAclFromSomewhere();
//            AclService.setAbilities(aclData);
        }
    }

    function runAclReject($rootScope, $location) {
        // If the route change failed due to our "Unauthorized" error, redirect them
        $rootScope.$on('$routeChangeError', function (current, previous, rejection) {
            if (rejection === 'Unauthorized') {
                console.log("--------Unauthorized------");
                $location.path('/');
            }
        })
    }

    function runMwlConfirm(confirmationPopoverDefaults) {
        confirmationPopoverDefaults.confirmButtonType = 'danger'; // Set the default confirm button type to be danger
    }
    function run($rootScope, $injector, $state, $http, $location, $localStorage) {
        //Add
        $rootScope.$state = $state;


        // keep user logged in after page refresh
        if ($localStorage.currentUser) {
            $http.defaults.headers.common.Authorization = 'Bearer ' + $localStorage.currentUser.token;
        }

        // redirect to login page if not logged in and trying to access a restricted page
        $rootScope.$on('$locationChangeStart', function (event, next, current) {
            if ($location.path().indexOf("/quen-mat-khau") < 0) {
                var publicPages = ['/login', '/quen-mat-khau', ''];
                var restrictedPage = $location.path() == "" || publicPages.indexOf($location.path()) === -1;
                console.log(restrictedPage);
                if (restrictedPage && !$localStorage.currentUser) {
                    $location.path('/login');
                }
            }
        });

        $rootScope.$on('tokenHasExpired', function () {
            alert('Your session has expired!');
        });

        $rootScope.$on('auth-logout', function () {
            return $rootScope.deleteAuthToken();
        });

        $rootScope.getAuthToken = function () {
            //return localStorage.getItem('id_token');
            return $localStorage.auth_token;
        }
        $rootScope.storeAuthToken = function (new_token) {
            return $localStorage.auth_token = new_token;
        }
        $rootScope.deleteAuthToken = function () {
            delete $localStorage.currentUser;
            return delete $localStorage.auth_token;
        }
    }


    function refreshToken($rootScope, AuthenticationService) {
//        console.log($rootScope.getAuthToken());
//        jwtOptionsProvider.tokenGetter = function (jwtHelper) {
//            var jwt = $rootScope.getAuthToken();
//            if (jwt) {
//                if (jwtHelper.isTokenExpired(jwt)) {
//                    AuthenticationService.refresh(jwt, null);
//                } else {
//                    return jwt;
//                }
//            }
//        }
    }

    function runWebsocket($websocket) {
        var ws = $websocket.$new({
            url: constAcl.ws,
            reconnect: true, // it will reconnect after 2 seconds
            reconnectInterval: 5000, // it will reconnect after 0.5 seconds
            protocols: ['binary', 'base64']
        });

        ws.$on('$open', function () {
            console.log('Oh my gosh, websocket is really open! Fukken awesome!');

//            ws.$emit('ping', 'hi listening websocket server'); // send a message to the websocket server

//            var data = {
//                level: 1,
//                text: 'ngWebsocket rocks!',
//                array: ['one', 'two', 'three'],
//                nested: {
//                    level: 2,
//                    deeper: [{
//                            hell: 'yeah'
//                        }, {
//                            so: 'good'
//                        }]
//                }
//            };
//
//            ws.$emit('pong', data);
        });

        ws.$on('pong', function (data) {
            console.log('The websocket server has sent the following data:');
            console.log(data);

            ws.$close();
        });

        ws.$on('$close', function () {
            console.log('Noooooooooou, I want to have more fun with ngWebsocket, damn it!');
        });
    }

    function myWebsocket($q, $rootScope) {
        // We return this object to anything injecting our service
        var Service = {};
        // Keep all pending requests here until they get responses
        var callbacks = {};
        // Create a unique callback ID to map requests to responses
        var currentCallbackId = 0;
        // Create our websocket object with the address to the websocket
        var ws = null;
        var uuid = "";

        function sendRequest(request) {
            var defer = $q.defer();
            var callbackId = getCallbackId();
            callbacks[callbackId] = {
                time: new Date(),
                cb: defer
            };
            request.callback_id = callbackId;
            console.log('Sending request', request);
            ws.send(JSON.stringify(request));
            return defer.promise;
        }

        function listener(data) {
            var messageObj = data;
            console.log("Received data from websocket: ", messageObj);
            // If an object exists with callback_id in our callbacks object, resolve it
            if (callbacks.hasOwnProperty(messageObj.callback_id)) {
                console.log(callbacks[messageObj.callback_id]);
                $rootScope.$apply(callbacks[messageObj.callback_id].cb.resolve(messageObj.data));
                delete callbacks[messageObj.callbackID];
            }
        }
        // This creates a new callback ID for a request
        function getCallbackId() {
            currentCallbackId += 1;
            if (currentCallbackId > 10000) {
                currentCallbackId = 0;
            }
            return currentCallbackId;
        }

        // Define a "getter" for getting customer data
        Service.getCustomers = function () {
            var request = {
                type: "get_customers"
            }
            // Storing in a variable for clarity on what sendRequest returns
            var promise = sendRequest(request);
            return promise;
        }

        Service.open = function (listDevice, callback) {
            ws = new WebSocket(constAcl.ws);
            ws.onopen = function () {
                console.log("Socket has been opened!");
            };

            ws.onmessage = function (message) {
                console.log(message);
                try {
                    var received_msg = JSON.parse(message.data);
                    if (received_msg) {
                        angular.forEach(received_msg, function (obj) {
                            console.log(obj.portStatus);
                            callback(obj);
                        });
//                        listener(JSON.parse(received_msg));
//                        $(received_msg).each(function (key, device) {
//                            var ports = $.parseJSON(device.data);
//                            $(ports).each(function (index, value) {
//                                $("#port_status_" + device.device + "_" + index).prop('checked', value == "1" ? true : false);
//                            });
//                        });
                    }
                } catch (err) {
                    console.error(err);
                    uuid = message.data;
                    var message = {id: message.data, "lstDevice": listDevice};
                    ws.send(JSON.stringify(message));
                }

            };

            ws.onclose = function () {
                console.log("Socket has been onclose!");
            };

            ws.onerror = function (event) {
                console.log("---onerror-------");
            };
        }

        Service.sendMessage = function (message) {
            console.log(message);
            var message = {id: uuid, "lstDevice": message};
            ws.send(JSON.stringify(message));
        }

        return Service;
    }
})();