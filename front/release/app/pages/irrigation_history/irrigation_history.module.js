/**
 * @author v.lugovsky
 * created on 16.12.2015
 */
(function () {
    'use strict';

    angular.module('BlurAdmin.pages.irrigation_history', ['ui.select', 'ngSanitize'])
            .config(routeConfig);

    function routeConfig($stateProvider) {
        $stateProvider
                .state('main.irrigation_history', {
                    url: '/irrigation_history',
                    templateUrl: 'app/pages/irrigation_history/view/index.html',
                    controller: 'IrrHisCtrl',
                    controllerAs: 'vm',
                    title: 'Lượng nước tưới',
                    sidebarMeta: {
                        icon: 'glyphicon glyphicon-header',
                        order: 31,
                        can: constAcl.irr_history
                    },
                    data: {
                        pageTitle: 'Lượng nước tưới',
                        requireLogin: true,
                        showTopContent: false
                    },
                    resolve: {
                        'acl': ['$q', 'AclService', function ($q, AclService) {
                                if (AclService.can(constAcl.irr_history)) {
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
