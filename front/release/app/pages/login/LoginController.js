(function () {
    'use strict';

    angular
            .module('BlurAdmin')
            .controller('LoginController', LoginController);

    function LoginController($scope, $state, $location, AuthenticationService) {
//        $scope.username = "admin";
        $scope.username = "supperadmin";
        $scope.password = "admin";
        $scope.error = "";
        $scope.loading = false;

        initController();

        function initController() {
            // reset login status
            AuthenticationService.Logout();
        }

        $scope.login = function () {

            $scope.loading = true;
            AuthenticationService.Login($scope.username, $scope.password, function (result, response, status) {
                $scope.loading = false;
                console.log("----login status: " + status);
                if (result === true) {
                    //$location.path('/dashboard');
                    $state.go('main.dashboard');
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