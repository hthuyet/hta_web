/**
 * @author v.lugovsky
 * created on 16.12.2015
 */
(function () {
    'use strict';

    angular.module('BlurAdmin.pages.charts', [
        'BlurAdmin.pages.charts.amCharts',
        'BlurAdmin.pages.charts.chartJs',
        'BlurAdmin.pages.charts.chartist',
        'BlurAdmin.pages.charts.morris'
    ])
            .config(routeConfig);

    /** @ngInject */
    function routeConfig($stateProvider) {
        $stateProvider
                .state('main.charts', {
                    url: '/charts',
                    abstract: true,
                    template: '<div ui-view  autoscroll="true" autoscroll-body-top></div>',
                    title: 'Charts',
                    sidebarMeta: {
                        icon: 'ion-stats-bars',
                        order: 150,
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
                });
    }

})();
