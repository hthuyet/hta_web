/**
 * @author v.lugovsky
 * created on 16.12.2015
 */
(function () {
    'use strict';

    angular.module('BlurAdmin.pages.device', ['ui.select', 'ngSanitize'])
            .config(routeConfig);

    /** @ngInject */
    function routeConfig($stateProvider) {

        $stateProvider
                .state('main.device', {
                    url: '/device',
                    templateUrl: 'app/pages/device/view/index.html',
                    controller: 'DeviceCtrl',
                    title: 'Thiết bị',
                    sidebarMeta: {
                        icon: 'ion-help-buoy',
                        order: 10,
                        can: constAcl.device_view
                    },
                    data: {
                        pageTitle: 'Quản lý thiết bị',
                        requireLogin: true,
                        showTopContent: false
                    },
                    resolve: {
                        'acl': ['$q', 'AclService', function ($q, AclService) {
                                if (AclService.can(constAcl.device_view)) {
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
