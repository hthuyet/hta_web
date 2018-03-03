/**
 * @author thuyetlv
 * created on 18/11/2017
 */

angular.module('BlurAdmin.pages.irrigation_history')
        .controller('IrrHisCtrl', function ($scope, AreaService, IrrHisService, AclService, $uibModal, cfpLoadingBar,
                usSpinnerService, toastr, toastrConfig) {
            var vm = this;
            vm.irr_history = AclService.can(constAcl.irr_history);

            //paging
            vm.AclService = AclService;
            vm.constAcl = constAcl;
            vm.isLoading = false;
            vm.pagination = {
                currentPage: 1,
                maxSize: 5,
                totalItems: 0,
                itemPerPage: 10,
            };
            var now = new Date();
            vm.fromDate = now;
            vm.toDate = now;
            vm.sum = "";

            vm.data = [];

            function loadData() {
                if (vm.area && vm.area.id && vm.fromDate && vm.toDate) {
                    vm.isLoading = true;
                    var params = {
                        params: {
                            'page': vm.pagination.currentPage,
                            'limit': vm.pagination.itemPerPage,
                            'fromDate': vm.fromDate,
                            'toDate': vm.toDate,
                        }
                    };
                    IrrHisService.loadData(vm.area.id, params, function (result, response, status) {
                        vm.isLoading = false;
                        if (result === true) {
                            vm.data = response.data;
                            vm.sum = response.sum;
                            vm.pagination.totalItems = response.total;
                        } else {
                            console.log(response);
                        }
                    });
                }
            }

            vm.pageChanged = function () {
                console.log('Page changed to: ' + $scope.pagination.currentPage);
                loadData();
            };


            //Open modal
            vm.open = function (item, ctrl, page, size) {
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
                modalInstance.result.then(function (message) {
                    if (message != null) {
                        toastr[message.type](message.message, message.title);
                        loadData();
                    }
                })
            };

            //Date picker
            vm.open = open;
            vm.openedStart = false;
            vm.openedEnd = false;
            vm.format = 'dd/MM/yyyy';
            vm.options = {
                showWeeks: false
            };

            function open(type) {
                if (type == 0) {
                    vm.openedStart = true;
                } else {
                    vm.openedEnd = true;
                }
            }

            //Select
            vm.lstArea = [];
            function loadArea() {
                AreaService.loadData({}, function (result, response, status) {
                    if (result === true) {
                        vm.lstArea = response.data;
                    } else {
                        console.log(response);
                        vm.lstArea = [];
                    }
                });
            }

            loadArea();

            vm.area = {};
            vm.onChangeArea = function (item) {
                vm.area.id = item.id;
                vm.area.code = item.code;
                vm.area.name = item.name;
                loadData();
            }

            vm.changeDateTime = function () {
                loadData();
            }

        }
        );

