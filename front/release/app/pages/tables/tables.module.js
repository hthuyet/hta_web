/**
 * @author v.lugovsky
 * created on 16.12.2015
 */
(function () {
    'use strict';

    angular.module('BlurAdmin.pages.tables', [])
            .config(routeConfig);

    /** @ngInject */
    function routeConfig($stateProvider, $urlRouterProvider) {
        $stateProvider
                .state('main.tables', {
                    url: '/tables',
                    template: '<ui-view  autoscroll="true" autoscroll-body-top></ui-view>',
                    abstract: true,
                    controller: 'TablesPageCtrl',
                    title: 'Tables',
                    sidebarMeta: {
                        icon: 'ion-grid',
                        order: 300,
                        can: constAcl.supper_admin
                    },
                    resolve: {
                        'acl': ['$q', 'AclService', function ($q, AclService) {
                                if (AclService.can(constAcl.supper_admin)) {
                                    // Has proper permissions
                                    return true;
                                } else {
                                    // Does not have permission
                                    return $q.reject('Unauthorized');
                                }
                            }]
                    }
                }).state('main.tables.basic', {
            url: '/basic',
            templateUrl: 'app/pages/tables/basic/tables.html',
            title: 'Basic Tables',
            sidebarMeta: {
                order: 0,
            },
        }).state('main.tables.smart', {
            url: '/smart',
            templateUrl: 'app/pages/tables/smart/tables.html',
            title: 'Smart Tables',
            sidebarMeta: {
                order: 100,
            },
        });
        $urlRouterProvider.when('/tables', '/tables/basic');
    }

})();
