/**
 * @author v.lugovsky
 * created on 16.12.2015
 */
(function () {
    'use strict';

    angular.module('BlurAdmin.pages.dashboard', [])
            .config(routeConfig);

    /** @ngInject */
    function routeConfig($stateProvider) {
        $stateProvider
                .state('main.dashboard', {
                    url: '/dashboard',
                    templateUrl: 'app/pages/dashboard/dashboard.html',
                    title: 'Dashboard',
                    data: {
                        pageTitle: 'Dashboard',
                        requireLogin: true,
                        showTopContent: true
                    },
                    sidebarMeta: {
                        icon: 'ion-android-home',
                        order: 0,
                    },
                });
    }

})();
