angular.module('BlurAdmin.theme')
        .directive('customSpinnerBar', customSpinnerBar);

function customSpinnerBar($http) {
    return {
        restrict: 'EA',
        replace: true,
        link: function (scope, element, attrs) {
            scope.isLoading = function () {
                return $http.pendingRequests.length > 0;
            };
            scope.$watch(scope.isLoading, function (v) {
                if (v) {
                    element.removeClass('hide');
                } else {
                    element.addClass('hide'); // hide spinner bar
                    document.body.className = document.body.className.replace("page-on-load", "");
//                        try {
//                            $('body').removeClass('page-on-load'); // remove page loading indicator
//                        } catch (c) {
//                            console.log(c);
//                        }
                }
            });

            //Add by thuyetlv
//                scope.$watch('submitting', function (value) {
//                    if (value === true || value === undefined) {
//                        element.removeClass('hide');
//                    } else {
//                        element.addClass('hide'); // hide spinner bar
//                        $('body').removeClass('page-on-load'); // remove page loading indicator
//                    }
//                });
            //End add
        }
    };
}