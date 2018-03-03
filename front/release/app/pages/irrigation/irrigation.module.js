/**
 * @author v.lugovsky
 * created on 16.12.2015
 */
(function () {
    'use strict';

    angular.module('BlurAdmin.pages.irrigation', ['ui.select', 'ngSanitize'])
            .config(routeConfig);

    function routeConfig($stateProvider) {
        $stateProvider
                .state('main.irrigation', {
                    url: '/irrigation',
                    templateUrl: 'app/pages/irrigation/view/index.html',
                    controller: 'IrrCtrl',
                    title: 'Quản lý lịch tưới',
                    sidebarMeta: {
                        icon: 'glyphicon  glyphicon-tint',
//                        icon: 'glyphicon  glyphicon-grain',
                        order: 30,
                        can: constAcl.irr_view || constAcl.irr_manage
                    },
                    data: {
                        pageTitle: 'Quản lý lịch tưới',
                        requireLogin: true,
                        showTopContent: false
                    },
                    resolve: {
                        'acl': ['$q', 'AclService', function ($q, AclService) {
                                if (AclService.can(constAcl.irr_view) || AclService.can(constAcl.irr_manage)) {
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
