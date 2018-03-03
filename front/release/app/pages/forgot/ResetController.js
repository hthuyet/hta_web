(function () {
    'use strict';

    angular
            .module('BlurAdmin')
            .controller('ResetController', ResetController);

    function ResetController($scope, $state, $stateParams, AuthenticationService) {
        $scope.email = "lethuyet.10.11.1990@gmail.com";
        $scope.token = $stateParams.token;
        $scope.password = "";
        $scope.error = "";
        $scope.loading = false;

        console.log($stateParams.token);

        $scope.reset = function () {
            console.log($scope.formReset.$invalid);
            if ($scope.formReset.$invalid) {
                var ele = angular.element("[name='" + $scope.formReset.$name + "']").find('.ng-invalid:visible:first');
                console.log(ele);
                setTimeout(function () {
                    ele.focus();
                }, 10);
                $scope.error = "Lỗi";
                return false;
            }
            $scope.loading = true;
            AuthenticationService.reset($scope.token, $scope.email, $scope.password, function (result, response, status) {
                console.log(response);
                $scope.loading = false;
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