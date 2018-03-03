(function () {
    'use strict';

    angular
            .module('BlurAdmin')
            .controller('LoginController', LoginController);

    function LoginController($scope, $state, $location, AuthenticationService, vcRecaptchaService) {
        $scope.username = "";
//        $scope.username = "supperadmin";
        $scope.password = "";
        $scope.error = "";
        $scope.loading = false;

        initController();

        function initController() {
            // reset login status
            AuthenticationService.Logout();
        }

        //Captcha
        $scope.response = null;
        $scope.widgetId = null;
        $scope.setResponse = function (response) {
            $scope.loading = false;
            console.info('Response available');
            console.log(response);
            $scope.response = response;
        };
        $scope.setWidgetId = function (widgetId) {
            console.info('Created widget ID: %s', widgetId);
            $scope.widgetId = widgetId;
        };
        $scope.cbExpiration = function () {
            $scope.loading = false;
            console.info('Captcha expired. Resetting response object');
            vcRecaptchaService.reload($scope.widgetId);
            $scope.response = null;
        };

        $scope.login = function () {
            if(!$scope.response || $scope.response == null){
                $scope.error = 'Bạn chưa xác nhận!';
                return;
            }

            $scope.loading = true;
            AuthenticationService.Login($scope.username, $scope.password, function (result, response, status) {
                $scope.loading = false;
                console.log("----login status: " + status);
                if (result === true) {
                    //$location.path('/dashboard');
                    $state.go('main.device');
                } else {
                    if (response && response.message) {
                        $scope.error = response.message;
                    } else {
                        $scope.error = 'Username or password is incorrect';
                    }
                }
            });
        };
    }
})();