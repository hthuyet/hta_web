/**
 * @author thuyetlv
 * created on 18/11/2017
 */

angular.module('BlurAdmin.pages.device').controller('ListDeviceScheduleCtrl', [
    '$scope', '$uibModalInstance', '$uibModal', 'DeviceService', 'item', 'toastr', 'toastrConfig', 'AclService', 'cfpLoadingBar'
            , function ($scope, $uibModalInstance, $uibModal, DeviceService, item,
                    toastr, toastrConfig, AclService, cfpLoadingBar) {
                $scope.device_control = AclService.can(constAcl.device_control);
                $scope.device = angular.copy(item);
                $scope.isLoading = false;
                $scope.pagination = {
                    currentPage: 1,
                    maxSize: 5,
                    totalItems: 0,
                    itemPerPage: 5,
                };
                $scope.data = [];
                loadData();

                function loadData() {
                    $scope.isLoading = true;
                    var params = {
                        params: {
                            'page': $scope.pagination.currentPage,
                            'limit': $scope.pagination.itemPerPage,
                            'search': $scope.search,
                            'ordering': "-id"
                        }
                    };
                    DeviceService.listScheduleDevice($scope.device.id, params, function (result, response, status) {
                        $scope.isLoading = false;
                        if (result === true) {
                            $scope.data = response.data;
                        } else {
                            if (status == constAcl.not_permission_device) {
                                var message = {
                                    "type": "error",
                                    "message": response.message,
                                    "title": "Lỗi: ",
                                };
                                $uibModalInstance.close(message, false);
                            }
                        }
                    });
                }

                $scope.pageChanged = function () {
                    loadData();
                };

                $scope.delete = function (item) {
                    cfpLoadingBar.start();
                    DeviceService.deleteServer(item.id, function (result, response, status) {
                        $scope.saving = false;
                        if (result === true) {
                            cfpLoadingBar.complete();
                            loadData();
                        } else {
                            cfpLoadingBar.complete();
                            showError("Lỗi hệ thống");
                        }
                    });
                }

                $scope.add = function () {
                    $scope.open({}, 'DeviceScheduleCtrl as ctrl', 'app/pages/device/view/deviceSchedule.html', 'lg');
                };

                $scope.edit = function (item) {
                    $scope.open(item, 'DeviceScheduleCtrl as ctrl', 'app/pages/device/view/deviceSchedule.html', 'lg');
                };

                //Open modal
                $scope.open = function (item, ctrl, page, size) {
                    var modalInstance = $uibModal.open({
                        animation: true,
                        templateUrl: page,
                        controller: ctrl,
                        size: size,
                        resolve: {
                            device: function () {
                                return $scope.device;
                            },
                            item: function () {
                                return item;
                            },
                        }
                    });
                    modalInstance.result.then(function (message) {
                        console.log("sumbited value inside parent controller", message);
                        if (message != null) {
                            toastr[message.type](message.message, message.title);
                            if (message.reload) {
                                loadData();
                            }
                        }
                    })
                };

                function showError(message) {
                    $("#myAlert").removeClass('bg-danger');
                    $("#myAlert").removeClass('bg-success');
                    $("#myAlert").addClass('bg-danger');
                    $("#alertContent").html(message);
                    $("#myAlert").show();
                }
            }
]);

angular.module('BlurAdmin.pages.device').controller('DeviceScheduleCtrl', [
    '$scope', '$uibModalInstance', '$uibModal', 'DeviceService', 'device', 'item', 'toastr', 'toastrConfig'
            , function ($scope, $uibModalInstance, $uibModal, DeviceService, device, item,
                    toastr, toastrConfig) {
                var date = new Date();
                date.setHours(0);
                date.setMinutes(0);
                date.setSeconds(0);
                $scope.device = angular.copy(device);
                $scope.schedule = angular.copy(item);
                console.log($scope.schedule);


                $scope.listPort = [];
                $scope.listBlocks = [];

                function formatDate(value) {
                    if (value && value != "") {
                        var res = value.split(":");
                        date.setHours(parseInt(res[0]));
                        date.setMinutes(parseInt(res[1]));
                        date.setSeconds(parseInt(res[2]));
                    } else {
                        date.setHours(0);
                        date.setMinutes(0);
                        date.setSeconds(0);
                    }
                    return date;
                }

                if ($scope.schedule && $scope.schedule.id) {
                    var stt = 0;
                    $scope.device.ports.forEach(function (obj) {
                        $scope.listPort[stt] = {"id": stt++, "label": "Cổng " + (stt)};
                    });
                    stt = 0;
                    var data = JSON.parse($scope.schedule.data);
                    var block = data.block;
                    var enable = data.enable;
                    var number = data.number;
                    block.forEach(function (obj) {
                        $scope.listBlocks[stt] = {
                            "id": (stt),
                            "label": "Block " + (stt + 1),
                            "status": (enable[stt] != ""),
                            "start": enable[stt],
                            "time": parseInt(number[stt]),
                            "value": parseInt(obj),
                        };
                        stt++;
                    });
                } else {
                    var stt = 0;
                    $scope.device.ports.forEach(function (obj) {
                        $scope.listPort[stt] = {"id": stt++, "label": "Cổng " + (stt)};
                    });
                    stt = 0;
                    $scope.device.blocks.forEach(function (obj) {
                        $scope.listBlocks[stt] = {
                            "id": (stt),
                            "label": "Block " + (++stt),
                            "status": false,
                            "start": "",
                            "time": 0,
                            "value": 0,
                        };
                    });
                }

                $scope.switcherChange = function (port) {
                    //Vi change chua kip set value nen check nguoc
                    if (port.status == false) {
                        port.value = 1;
                    } else {
                        port.value = 0;
                    }
                }

                $scope.saving = false;
                $scope.save = function () {
//                    if ($scope.myForm.$invalid) {
//                        var ele = angular.element("[name='" + $scope.myForm.$name + "']").find('.ng-invalid:visible:first');
//                        console.log(ele);
//                        setTimeout(function () {
//                            ele.focus();
//                        }, 10);
//                        return false;
//                    }

                    $scope.isDirty = $scope.myForm.$dirty;
                    if (!$scope.isDirty) {
                        //Khong co thay doi tren form
                        $uibModalInstance.close(null);
                    }

                    var blocks = [];
                    var starts = [];
                    var times = [];
                    angular.forEach($scope.listBlocks, function (obj) {
                        blocks.push(obj.value);
                        if (obj.status == false) {
                            starts.push("");
                            times.push("");
                        } else {
                            starts.push(obj.start);
                            times.push(obj.time);
                        }
                    });

                    $scope.saving = true;
                    var params = {
                        'id': (!$scope.schedule || !$scope.schedule.id) ? "" : $scope.schedule.id,
                        'relay': $scope.schedule.relay,
                        'block': blocks,
                        'enable': starts,
                        'number': times
                    };

                    DeviceService.scheduleDevice($scope.device.id, params, function (result, response, status) {
                        $scope.saving = false;
                        if (result === true) {
                            var message = {
                                "type": "success",
                                "message": response.message,
                                "title": "Thành công: ",
                            };
                            $uibModalInstance.close(message);
                        } else {
                            showError(response.message);
                        }
                    });
                }

                function showError(message) {
                    $("#myAlert").removeClass('bg-danger');
                    $("#myAlert").removeClass('bg-success');
                    $("#myAlert").addClass('bg-danger');
                    $("#alertContent").html(message);
                    $("#myAlert").show();
                    return;
                }

            }
]);