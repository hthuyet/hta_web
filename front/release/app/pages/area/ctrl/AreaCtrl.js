/**
 * @author thuyetlv
 * created on 18/11/2017
 */

angular.module('BlurAdmin.pages.area')
        .controller('AreaCtrl', function ($scope, AreaService, AclService, $uibModal, cfpLoadingBar,
                usSpinnerService, toastr, toastrConfig) {
            $scope.area_manage = AclService.can(constAcl.area_manage);

            //paging
            $scope.AclService = AclService;
            $scope.constAcl = constAcl;
            $scope.isLoading = false;
            $scope.pagination = {
                currentPage: 1,
                maxSize: 5,
                totalItems: 0,
                itemPerPage: 10,
            };
            $scope.searchValue = "";
            $scope.data = [];
            loadData();
            function loadData() {
                $scope.isLoading = true;
                var params = {
                    params: {
                        'page': $scope.pagination.currentPage,
                        'limit': $scope.pagination.itemPerPage,
                        'search': $scope.searchValue,
                        'ordering': "id"
                    }
                };
                AreaService.loadData(params, function (result, response, status) {
                    $scope.isLoading = false;
                    if (result === true) {
                        $scope.data = response.data;
                        $scope.pagination.totalItems = response.total;
                    } else {
                        console.log(response);
                    }
                });
            }

            $scope.pageChanged = function () {
                console.log('Page changed to: ' + $scope.pagination.currentPage);
                loadData();
            };

            $scope.search = function () {
                console.log($scope.searchValue);
                loadData();
            }

            $scope.$watch('searchValue', function (newVal, oldVal) {
                if (angular.isDefined(newVal) && newVal !== oldVal) {
                    $scope.search();
                }
            });

            //Action
            $scope.delete = function (item) {
                cfpLoadingBar.start();
                AreaService.remove(item.id, function (result, response, status) {
                    cfpLoadingBar.complete();
                    if (result === true) {
                        loadData();
                    } else {
                        console.log(response);
                    }
                });
            };

            $scope.add = function () {
                $scope.open(null, 'AreaModalCtrl as ctrl', 'app/pages/area/view/edit.html', 'lg');
            };
            $scope.edit = function (item) {
                $scope.open(item, 'AreaModalCtrl as ctrl', 'app/pages/area/view/edit.html', 'lg');
            };

            //Open modal
            $scope.open = function (item, ctrl, page, size) {
                var modalInstance = $uibModal.open({
                    animation: true,
                    templateUrl: page,
                    controller: ctrl,
                    size: size,
                    resolve: {
                        item: function () {
                            return item;
                        }
                    }
                });
                modalInstance.result.then(function (message, reload) {
                    if (message != null) {
                        toastr[message.type](message.message, message.title);
                        if (message.reload) {
                            loadData();
                        } else {
                            if (reload) {
                                loadData();
                            }
                        }
                    }
                })
            };


        }
        );

