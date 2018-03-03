/**
 * @author v.lugovksy
 * created on 16.12.2015
 */
(function () {
    'use strict';

    angular.module('BlurAdmin.theme.components')
            .controller('BaSidebarCtrl', BaSidebarCtrl);

    /** @ngInject */
    function BaSidebarCtrl($scope, baSidebarService, AclService) {
        $scope.menuItems = [];
        var lstMenus = baSidebarService.getMenuItems();
        angular.forEach(lstMenus, function (menu) {
            if (menu.can) {
                if (AclService.can(menu.can)) {
                    $scope.menuItems.push(menu);
                }
            } else {
                $scope.menuItems.push(menu);
            }

        });
        $scope.defaultSidebarState = $scope.menuItems[0].stateRef;

        $scope.hoverItem = function ($event) {
            $scope.showHoverElem = true;
            $scope.hoverElemHeight = $event.currentTarget.clientHeight;
            var menuTopValue = 66;
            $scope.hoverElemTop = $event.currentTarget.getBoundingClientRect().top - menuTopValue;
        };

        $scope.$on('$stateChangeSuccess', function () {
            if (baSidebarService.canSidebarBeHidden()) {
                baSidebarService.setMenuCollapsed(true);
            }
        });
    }
})();