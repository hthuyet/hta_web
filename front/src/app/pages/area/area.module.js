/**
 * @author v.lugovsky
 * created on 16.12.2015
 */
(function () {
    'use strict';

    angular.module('BlurAdmin.pages.area', ['ui.select', 'ngSanitize'])
            .config(routeConfig);

    function routeConfig($stateProvider) {
        $stateProvider
                .state('main.area', {
                    url: '/area',
                    templateUrl: 'app/pages/area/view/index.html',
                    controller: 'AreaCtrl',
                    title: 'Khu vực',
                    sidebarMeta: {
                        icon: 'glyphicon glyphicon-map-marker',
                        order: 11,
                        can: constAcl.area_view
                    },
                    data: {
                        pageTitle: 'Quản lý khu vực',
                        requireLogin: true,
                        showTopContent: false
                    },
                    resolve: {
                        'acl': ['$q', 'AclService', function ($q, AclService) {
                                if (AclService.can(constAcl.area_view)) {
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
