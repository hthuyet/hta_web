/**
 * @author v.lugovsky
 * created on 23.12.2015
 */
(function () {
    'use strict';

    angular.module('BlurAdmin.theme')
            .factory('baPanel', baPanel);

    /** @ngInject */
    function baPanel() {

        /** Base baPanel directive */
        return {
            restrict: 'A',
            scope: {
                searchValue: '='
            },
            transclude: true,
            link: function (scope, element, attrs) {
            },
            template: function (elem, attrs) {
                var res = '<div class="panel-body" ng-transclude></div>';
                if (attrs.baPanelTitle) {
                    var titleTpl = '<div class="panel-heading clearfix"><h3 class="panel-title">' + attrs.baPanelTitle + ' ';
                    if (attrs.baPanelSearch) {
                        titleTpl += '<div class="float-lg-right pull-right" style="margin-top: -10px;"><input type="input" class="form-control" placeholder="Tìm kiếm" ng-model="searchValue" ng-model-options="{ debounce: 1000 }"/></div>';
                    }
                    titleTpl += '</h3></div>';
                    res = titleTpl + res; // title should be before
                }

                return res;
            }
        };
    }

})();
