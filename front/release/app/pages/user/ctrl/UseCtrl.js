/**
 * @author thuyetlv
 * created on 18/11/2017
 */

angular.module('BlurAdmin.pages.user')
        .controller('UseCtrl', function ($scope, UserService, RoleService, AclService, $uibModal, cfpLoadingBar,
                usSpinnerService, toastr, toastrConfig) {
            $scope.user_manage = AclService.can(constAcl.user_manage);

            //paging
            $scope.AclService = AclService;
            $scope.constAcl = constAcl;
//            $scopecanuser_manage = constAcl.user_manage;
            $scope.isLoading = false;
            $scope.pagination = {
                currentPage: 1,
                maxSize: 5,
                totalItems: 0,
                itemPerPage: 20,
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
                UserService.loadData(params, function (result, response, status) {
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
                loadData();
            };

            $scope.search = function () {
                loadData();
            }

            $scope.$watch('searchValue', function (newVal, oldVal) {
                if (angular.isDefined(newVal) && newVal !== oldVal) {
                    $scope.search();
                }
            });

            //Loading
            $scope.start = function () {
                usSpinnerService.spin('spinner-1');
                cfpLoadingBar.start();
            };

            //Load Data
            RoleService.loadData({}, function (result, response, status) {
                if (result === true) {
                    $scope.lstRole = response;
                } else {
                    console.log(response);
                }
            });

            //Action
            $scope.delete = function (item) {
                cfpLoadingBar.start();
                UserService.remove(item.id, function (result, response, status) {
                    cfpLoadingBar.complete();
                    if (result === true) {
                        toastr["success"](response.message, "Thành công");
                        loadData();
                    } else {
                        toastr["error"](response.message, "Thất bại");
                    }
                });
            };

            $scope.add = function () {
                $scope.open(null, 'UserModalCtrl as ctrl', 'app/pages/user/view/edit.html', 'lg');
            };
            $scope.edit = function (item) {
                $scope.open(item, 'UserModalCtrl as ctrl', 'app/pages/user/view/edit.html', 'lg');
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
                        },
                        lstRole: function () {
                            return $scope.lstRole;
                        }
                    }
                });
                modalInstance.result.then(function (message) {
                    if (message != null) {
                        toastr[message.type](message.message, message.title);
                        loadData();
                    }
                })
            };


        }
        );

