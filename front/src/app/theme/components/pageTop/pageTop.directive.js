/**
 * @author v.lugovksy
 * created on 16.12.2015
 */
(function () {
    'use strict';

    angular.module('BlurAdmin.theme.components')
            .directive('pageTop', pageTop);

    /** @ngInject */
    function pageTop() {
        return {
            scope: {
                logout: '&',
            },
            restrict: 'E',
            templateUrl: 'app/theme/components/pageTop/pageTop.html',
        };
    }

})();