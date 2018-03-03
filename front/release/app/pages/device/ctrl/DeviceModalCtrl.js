/**
 * @author thuyetlv
 * created on 18/11/2017
 */

angular.module('BlurAdmin.pages.device').controller('DeviceModalCtrl', [
    '$scope', '$uibModalInstance', '$uibModal', 'DeviceService', 'item', 'lstDeviceType', 'lstUser', 'toastr', 'toastrConfig'
            , function ($scope, $uibModalInstance, $uibModal, DeviceService, item, lstDeviceType,
                    lstUser, toastr, toastrConfig) {
                var ctrl = this;
                $scope.device = angular.copy(item);
                $scope.deviceType = {};
                $scope.assign = {};

                $scope.switches = {};
                $scope.title = "Thêm mới thiết bị";
                if ($scope.device) {
                    $scope.title = "Chỉnh sửa thiết bị";
                    var lstPort = JSON.parse($scope.device.port_status);
                    if (lstPort && lstPort.length > 0) {
                        var stt = 0;
                        lstPort.forEach(function (obj) {
                            if (obj == 1 || obj == "1") {
                                $scope.switches["port_" + stt++] = true;
                            } else {
                                $scope.switches["port_" + stt++] = false;
                            }
                        });
                    }

                    if (lstDeviceType) {
                        lstDeviceType.forEach(function (deviceType) {
                            if (deviceType.id == $scope.device.devicetype_id) {
                                $scope.deviceType = deviceType;
                            }
                        });
                    }

                    if (lstUser) {
                        lstUser.forEach(function (obj) {
                            if (obj.id == $scope.device.assign_id) {
                                $scope.assign = obj;
                            }
                        });
                    }

                    console.log($scope.assign);
                }

                $scope.lstDeviceType = lstDeviceType;
                $scope.lstUser = lstUser;

                $scope.saving = false;
                $scope.save = function () {
                    $scope.isDirty = $scope.myForm.$dirty;
                    if (!$scope.isDirty) {
                        //Khong co thay doi tren form
                        $uibModalInstance.close(null);
                    }

                    $scope.saving = true;
                    var params = {
                        'id': $scope.device.id,
                        'name': $scope.device.name,
                        'code': $scope.device.code,
                        'devicetype_id': $scope.device.devicetype_id,
                        'assign_id': $scope.device.assign_id,
                        'manufacture_date': $scope.device.manufacture_date,
                        'warranty_date': $scope.device.warranty_date,
                    };
                    DeviceService.save(params, function (result, response, status) {
                        $scope.saving = false;
                        if (result === true) {
                            var message = {
                                "type": "success",
                                "message": response.message,
                                "title": "Lưu thiết bị: ",
                                reload: true
                            };
                            $uibModalInstance.close(message, true);
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

                $scope.onChangeType = function (item) {
                    $scope.device.devicetype_id = item.id;
                    $scope.device.device_type_name = item.name;
                }
                $scope.onChangeAssign = function (item) {
                    $scope.device.assign_id = item.id;
                    $scope.device.assign_username = item.username;
                }


                //Date picker
                function convertToDate(value) {
                    var parts = value.split(' ');
                    return new Date(parts[0]);
                }
                ctrl.manufacture_date = new Date();
                ctrl.warranty_date = new Date();
                if ($scope.device) {
                    ctrl.manufacture_date = convertToDate($scope.device.manufacture_date);
                    ctrl.warranty_date = convertToDate($scope.device.warranty_date);
                }
                ctrl.open = open;
                ctrl.openedStart = false;
                ctrl.openedEnd = false;
                ctrl.format = 'dd/MM/yyyy';
                ctrl.options = {
                    showWeeks: false
                };

                function open(type) {
                    if (type == 0) {
                        ctrl.openedStart = true;
                    } else {
                        ctrl.openedEnd = true;
                    }
                }

                ctrl.changeDateTime = function () {                    
                    $scope.device.manufacture_date = ctrl.manufacture_date;
                    $scope.device.warranty_date = ctrl.warranty_date;
                }

            }
]);