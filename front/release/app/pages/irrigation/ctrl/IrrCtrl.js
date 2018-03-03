/**
 * @author thuyetlv
 * created on 18/11/2017
 */

angular.module('BlurAdmin.pages.irrigation')
        .controller('IrrCtrl', function ($scope, IrrService, DeviceService, AreaService, AclService, $uibModal, cfpLoadingBar,
                usSpinnerService, toastr, toastrConfig) {
            $scope.irr_view = AclService.can(constAcl.irr_view);
            $scope.irr_manage = AclService.can(constAcl.irr_manage);

            //paging
            $scope.AclService = AclService;
            $scope.constAcl = constAcl;
//            $scopecanuser_manage = constAcl.user_manage;
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
                IrrService.loadData(params, function (result, response, status) {
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
                    loadData();
                }
            });

            //Loading
            $scope.start = function () {
                usSpinnerService.spin('spinner-1');
                cfpLoadingBar.start();
            };

            $scope.loadDevice = function () {
                var params = {
                    params: {
                        'limit': 0,
                        'ordering': "id"
                    }
                };
                DeviceService.loadData(params, function (result, response, status) {
                    if (result === true) {
                        $scope.lstDevice = response.data;
                    } else {
                        $scope.lstDevice = [];
                        console.log(response);
                    }
                });
            };

            //Load Data
            $scope.loadDevice();


            //Action
            $scope.delete = function (item) {
                cfpLoadingBar.start();
                IrrService.remove(item.id, function (result, response, status) {
                    cfpLoadingBar.complete();
                    console.log(response);
                    if (result === true) {
                        toastr["success"](response.message, "Thành công");
                        loadData();
                    } else {
                        toastr["error"](response.message, "Thất bại");
                        console.log(response);
                    }
                });
            };

            $scope.add = function () {
                $scope.open(null, 'TestModalCtrl', 'app/pages/irrigation/view/edit.html', 'full');
            };
            $scope.edit = function (item) {
                $scope.open(item, 'TestModalCtrl', 'app/pages/irrigation/view/edit.html', 'full');
            };
            $scope.history = function (item) {
                $scope.open(item, 'HistoryModalCtrl', 'app/pages/irrigation/view/edit.html', 'full');
            };


            $scope.lstArea = [];
            function loadArea() {
                $scope.loading = true;
                AreaService.loadData({}, function (result, response, status) {
                    $scope.loading = false;
                    if (result === true) {
                        $scope.lstArea = response.data;
                    } else {
                        console.log(response);
                    }
                });
            }
            loadArea();

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
                        lstDevice: function () {
                            return $scope.lstDevice;
                        },
                        lstArea: function () {
                            return $scope.lstArea;
                        }
                    }
                });
                modalInstance.result.then(function (message) {
                    console.log(message);
                    if (message != null) {
                        toastr[message.type](message.message, message.title);
                        loadData();
                    }
                })
            };


        }
        );

