/**
 * @author v.lugovsky
 * created on 16.12.2015
 */
(function () {
    'use strict';

    angular.module('BlurAdmin.pages', [
        'ui.router',
        'BlurAdmin.pages.dashboard',
        'BlurAdmin.pages.ui',
        'BlurAdmin.pages.components',
        'BlurAdmin.pages.form',
        'BlurAdmin.pages.tables',
        'BlurAdmin.pages.charts',
        'BlurAdmin.pages.maps',
        'BlurAdmin.pages.profile',
        'BlurAdmin.pages.device',
        'BlurAdmin.pages.user',
        'BlurAdmin.pages.irrigation',
        'BlurAdmin.pages.irrigation_history',
        'BlurAdmin.pages.area',
    ])
            .config(routeConfig);

    /** @ngInject */
    function routeConfig($urlRouterProvider, $stateProvider, baSidebarServiceProvider) {
        $urlRouterProvider.otherwise('/dashboard');

        $stateProvider
                .state('main', {
                    url: '',
                    templateUrl: '../layout.html',
                    controller: 'pagesCtrl',
                    title: 'main',
                    sidebarMeta: {
                        order: 0,
                    },
                });

//        baSidebarServiceProvider.addStaticItem({
//            title: 'Pages',
//            icon: 'ion-document',
//            sidebarMeta: {
//                can: constAcl.supper_admin
//            },
//            subMenu: [{
//                    title: 'Sign In',
//                    fixedHref: 'auth.html',
//                    blank: true
//                }, {
//                    title: 'Sign Up',
//                    fixedHref: 'reg.html',
//                    blank: true
//                }, {
//                    title: 'User Profile',
//                    stateRef: 'profile'
//                }, {
//                    title: '404 Page',
//                    fixedHref: '404.html',
//                    blank: true
//                }]
//        });
//        baSidebarServiceProvider.addStaticItem({
//            title: 'Menu Level 1',
//            icon: 'ion-ios-more',
//            subMenu: [{
//                    title: 'Menu Level 1.1',
//                    disabled: true
//                }, {
//                    title: 'Menu Level 1.2',
//                    subMenu: [{
//                            title: 'Menu Level 1.2.1',
//                            disabled: true
//                        }]
//                }]
//        });
    }

})();
