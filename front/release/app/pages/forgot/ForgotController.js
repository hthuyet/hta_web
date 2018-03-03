(function () {
    'use strict';

    angular
            .module('BlurAdmin')
            .controller('ForgotController', ForgotController);

    function ForgotController($scope, $state, $location, AuthenticationService) {
        $scope.email = "lethuyet.10.11.1990@gmail.com";
        $scope.error = "";
        $scope.loading = false;
        
        var href = $state.href("getforgotpass");
        var url = window.location.host + "/" + href;
        console.log(url);

        $scope.login = function () {
            $scope.loading = true;
            AuthenticationService.forgot($scope.email,url, function (result, response, status) {
                $scope.loading = false;
                console.log("----login status: " + status);
                if (result === true) {
                    if (response.message) {
                        $scope.error = response.message;
                    } else {
                        $scope.error = "Reset password thành công";
                    }
                } else {
                    if (status === -1) {
                        $scope.error = "Lỗi hệ thống!";
                    }
                }
            });
        };
    }
})();