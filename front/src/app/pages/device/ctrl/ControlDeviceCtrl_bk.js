/**
 * @author thuyetlv
 * created on 18/11/2017
 */

angular.module('BlurAdmin.pages.device').controller('ControlDeviceCtrl_bk', [
    '$scope', '$uibModalInstance', '$uibModal', 'DeviceService', 'item', 'toastr', 'toastrConfig', 'cfpLoadingBar', 'usSpinnerService', 'msg'
            , function ($scope, $uibModalInstance, $uibModal, DeviceService, item,
                    toastr, toastrConfig, cfpLoadingBar, usSpinnerService, msg) {
                $scope.msg = msg;
                $scope.title = "Điều khiển thiết bị";
                $scope.device = angular.copy(item);
                $scope.canTimer = item.canTimer;
                $scope.device.type = "1";
                $scope.control = true;
                $scope.switches = item.switches;
                $scope.listType = [
                    {'id': 1, 'label': 'Bật'},
                    {'id': 0, 'label': 'Tắt'},
                ];

                if ($scope.msg != "") {
                    toastr["error"]($scope.msg, "Lỗi");
                }

                $scope.controlChange = function (type) {
                    if (type === false) {
                        $scope.device.type = "1";
                    } else {
                        $scope.device.type = "0";
                    }
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
                    if ($scope.myForm.$invalid) {
                        var ele = angular.element("[name='" + $scope.myForm.$name + "']").find('.ng-invalid:visible:first');
                        console.log(ele);
                        setTimeout(function () {
                            ele.focus();
                        }, 10);
//                        ele.focus();
//                        ele.focus();
                        console.log("------myForm invalid---");
//                        return false;
                    }

                    $scope.isDirty = $scope.myForm.$dirty;
                    if (!$scope.isDirty) {
                        //Khong co thay doi tren form
                        $uibModalInstance.close(null);
                    }

                    var ports = [];
                    var times = [];
                    var stt = 0;
                    angular.forEach($scope.switches, function (obj) {
                        ports.push(obj.value);
                        times[stt++] = obj.number;
                    });

                    $scope.saving = true;
                    var params = {
                        'id': $scope.device.id,
                        'type': $scope.device.type,
                        'port': ports,
                        'time': times,
                    };
                    DeviceService.control(params, function (result, response, status) {
                        $scope.saving = false;
                        if (result === true) {
                            var message = {
                                "type": "success",
                                "message": response.message,
                                "title": "Thành công",
                            };
                            $uibModalInstance.close(message);
                        } else {
                            if (response.message) {
                                showError(response.message);
                            } else {
                                showError(constAcl.errorMsg);
                            }
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

            }
]);