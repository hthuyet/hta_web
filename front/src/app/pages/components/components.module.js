/**
 * @author k.danovsky
 * created on 15.01.2016
 */
(function () {
    'use strict';

    angular.module('BlurAdmin.pages.components', [
        'BlurAdmin.pages.components.mail',
        'BlurAdmin.pages.components.timeline',
        'BlurAdmin.pages.components.tree',
    ])
            .config(routeConfig);

    /** @ngInject */
    function routeConfig($stateProvider) {
        $stateProvider
                .state('main.components', {
                    url: '/components',
                    template: '<ui-view  autoscroll="true" autoscroll-body-top></ui-view>',
                    abstract: true,
                    title: 'Components',
                    sidebarMeta: {
                        icon: 'ion-gear-a',
                        order: 100,
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
