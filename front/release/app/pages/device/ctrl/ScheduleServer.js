/**
 * @author thuyetlv
 * created on 18/11/2017
 */

angular.module('BlurAdmin.pages.device').controller('ListScheServer', [
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
                    itemPerPage: 10,
                };
                $scope.data = [];
                loadData();

                function loadData() {
                    $scope.isLoading = true;
                    var params = {
                        params: {
                            'id': $scope.device.id,
                            'page': $scope.pagination.currentPage,
                            'limit': $scope.pagination.itemPerPage,
                            'search': $scope.search,
                            'ordering': "-id"
                        }
                    };
                    DeviceService.listScheduleServer(params, function (result, response, status) {
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
                            console.log(response);
                        }
                    });
                }

                $scope.pageChanged = function () {
                    console.log('Page changed to: ' + $scope.pagination.currentPage);
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
                            console.log(response);
                            showError("Lỗi hệ thống");
                        }
                    });
                }

                $scope.add = function () {
                    $scope.open({"device_id": $scope.device.id, "ports": $scope.device.ports}, 'ScheServerModalCtrl as ctrl', 'app/pages/device/view/scheduleServer.html', 'lg');
                };

                $scope.edit = function (item) {
                    $scope.open(item, 'ScheServerModalCtrl as ctrl', 'app/pages/device/view/scheduleServer.html', 'lg');
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


angular.module('BlurAdmin.pages.device').controller('ScheServerModalCtrl', [
    '$scope', '$uibModalInstance', '$uibModal', 'DeviceService', 'item', 'toastr', 'toastrConfig'
            , function ($scope, $uibModalInstance, $uibModal, DeviceService, item, lstDeviceType,
                    lstUser, toastr, toastrConfig) {
                $scope.listType = [
                    {'id': 1, 'label': 'Hẹn theo thời điểm cố định'},
                    {'id': 2, 'label': 'Định kỳ theo ngày'},
                ];
                $scope.item = angular.copy(item);
                $scope.switches = {};
                $scope.title = "Thêm mới lịch server";
                if ($scope.item && $scope.item.id > 0) {
                    $scope.title = "Chỉnh sửa lịch server";
                    var command = JSON.parse($scope.item.command);
                    console.log(command);
                    if (command && command.data) {
                        var lstPort = JSON.parse("[" + command.data + "]");
                        if (lstPort && lstPort.length > 0) {
                            var stt = 0;
                            lstPort.forEach(function (obj) {
                                if (obj == 1 || obj == "1") {
                                    $scope.switches["port_" + stt++] = {
                                        "id": (stt - 1),
                                        "label": "Cổng " + stt,
                                        "status": true,
                                        "number": parseInt(command.time[stt - 1]),
                                        "value": 1,
                                    };
                                } else {
                                    $scope.switches["port_" + stt++] = {
                                        "id": (stt - 1),
                                        "label": "Cổng " + stt,
                                        "status": false,
                                        "number": parseInt(command.time[stt - 1]),
                                        "value": 0,
                                    };
                                }
                            });
                        }
                    }
                } else {
                    var lstPort = $scope.item.ports;
                    if (lstPort && lstPort.length > 0) {
                        var stt = 0;
                        lstPort.forEach(function (obj) {
                            $scope.switches["port_" + stt++] = {
                                "id": (stt - 1),
                                "label": "Cổng " + stt,
                                "status": false,
                                "number": 0,
                                "value": 2,
                            };
                        });
                    }
                }

                $scope.saving = false;
                $scope.save = function () {
                    if ($scope.myForm.$invalid) {
                        var ele = angular.element("[name='" + $scope.myForm.$name + "']").find('.ng-invalid:visible:first');
                        console.log(ele);
                        setTimeout(function () {
                            ele.focus();
                        }, 10);
//                        return false;
                    }
                    
                    $scope.isDirty = $scope.myForm.$dirty;
                    if (!$scope.isDirty) {
                        //Khong co thay doi tren form
                        $uibModalInstance.close(null);
                    }

                    var ports = [];
                    var times = [];
                    angular.forEach($scope.switches, function (obj) {
                        ports.push(obj.value);
                        times.push(obj.number);
                    });

                    $scope.saving = true;
                    var params = {
                        'id': $scope.item.id,
                        'device_id': $scope.item.device_id,
                        'type': $scope.item.type,
                        'content': $scope.item.content,
                        'port': ports,
                        'time': times,
                    };
                    DeviceService.scheduleServer(params, function (result, response, status) {
                        $scope.saving = false;
                        if (result === true) {
                            var message = {
                                "type": "success",
                                "message": response.message,
                                "title": "Lưu thiết bị: ",
                                "reload": true
                            };
                            $uibModalInstance.close(message);
                        } else {
                            console.log(response);
                            showError("Lỗi hệ thống");
                        }
                    });
                }

                function showError(message) {
                    $("#myAlert").removeClass('bg-danger');
                    $("#myAlert").removeClass('bg-success');
                    $("#myAlert").addClass('bg-danger');
                    $("#alertContent").html(message);
                    $("#myAlert").show();
                }

                $scope.setContentPattern = function () {
                    if ($scope.item.type == '1') {
                        $scope.contentPlaceHolder = 'dd/mm/yyyy HH:mi:ss';
                        $scope.contentPattern = /^([0-2][0-9]|3[0-1])\/(0[1-9]|1[0-2])\/([0-2][0-9]{3}) ([0-1][0-9]|2[0-3]):([0-5][0-9])\:([0-5][0-9])( ([\-\+]([0-1][0-9])\:00))?$/;
                        item.content = "";
                    } else if ($scope.item.type == '2') {
                        $scope.contentPlaceHolder = 'HH:mi:ss';
                        $scope.contentPattern = /^([0-1][0-9]|2[0-3]):([0-5][0-9])\:([0-5][0-9])( ([\-\+]([0-1][0-9])\:00))?$/;
                        item.content = "";
                    }
                }
                $scope.setContentPattern();

                $scope.switcherChange = function (port) {
                    //Vi change chua kip set value nen check nguoc
                    if (port.status == false) {
                        port.value = 1;
                    } else {
                        port.value = 0;
                    }
                }

            }
]);