(function () {
    'use strict';

    angular
            .module('BlurAdmin')
            .controller('pagesCtrl', pagesCtrl);

    function pagesCtrl($scope, $state, AuthenticationService) {
        $scope.logout = function () {
            AuthenticationService.Logout();
            $state.go('login');
        };
    }
})();