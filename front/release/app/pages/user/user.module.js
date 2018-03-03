/**
 * @author v.lugovsky
 * created on 16.12.2015
 */
(function () {
    'use strict';

    angular.module('BlurAdmin.pages.user', ['ui.select', 'ngSanitize'])
            .config(routeConfig);

    function routeConfig($stateProvider) {
        $stateProvider
                .state('main.user', {
                    url: '/user',
                    templateUrl: 'app/pages/user/view/index.html',
                    controller: 'UseCtrl',
                    title: 'Người dùng',
                    sidebarMeta: {
                        icon: 'glyphicon  glyphicon-user',
                        order: 20,
                        can: constAcl.user_view
                    },
                    data: {
                        pageTitle: 'Quản lý người dùng',
                        requireLogin: true,
                        showTopContent: false
                    },
                    resolve: {
                        'acl': ['$q', 'AclService', function ($q, AclService) {
                                if (AclService.can(constAcl.user_view)) {
                                    // Has proper permissions
                                    return true;
                                } else {
                                    // Does not have permission
                                    return $q.reject('Unauthorized');
                                }
                            }]
                    }
                })
                .state('main.changepass', {
                    url: '/changepass',
                    templateUrl: 'app/pages/user/view/changepass.html',
                    controller: 'ChangePassCtrl',
                    data: {
                        pageTitle: 'Đổi mật khẩu',
                        requireLogin: true,
                        showTopContent: false
                    },
                });
    }

})();
