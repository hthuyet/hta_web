/**
 * @author thuyetlv
 * created on 18/11/2017
 */

angular.module('BlurAdmin.pages.irrigation').controller('TestModalCtrl', [
    '$scope', '$uibModalInstance', '$uibModal', 'IrrService', 'item', 'lstDevice', 'lstArea', 'toastr',
    'toastrConfig', '$filter', 'editableOptions', 'editableThemes'
            , function ($scope, $uibModalInstance, $uibModal, IrrService, item, lstDevice, lstArea, toastr, toastrConfig,
                    $filter, editableOptions, editableThemes) {
                $scope.irrigation_id = (item && item.id) ? item.id : 0;
                $scope.item = (item != null) ? angular.copy(item) : {};
                if ($scope.item && $scope.item.from_date) {
                    var tmp = $scope.item.from_date.replace(" ", "T");
                    $scope.item.fromDate = new Date(tmp);
                } else {
                    $scope.item.fromDate = new Date();
                }

                if ($scope.item && $scope.item.to_date) {
                    var tmp = $scope.item.to_date.replace(" ", "T");
                    $scope.item.toDate = new Date(tmp);
                } else {
                    $scope.item.toDate = new Date();
                }

                $scope.lstDevice = lstDevice;
                $scope.lstPort = [
                    {"id": 0, "label": "Cổng 1"},
                    {"id": 1, "label": "Cổng 2"},
                    {"id": 2, "label": "Cổng 3"},
                    {"id": 3, "label": "Cổng 4"},
                ];
                $scope.title = "Thêm mới lịch tưới";
                $scope.lstArea = lstArea;
                $scope.area = {};
                if ($scope.item.id) {
                    $scope.title = "Cập nhật lịch tưới";
                    if ($scope.lstArea) {
                        $scope.lstArea.forEach(function (obj) {
                            if (obj.id == $scope.item.area_id) {
                                $scope.area = obj;
                            }
                        });
                    }
                }
                $scope.onChangeArea = function (item) {
                    $scope.item.area_id = item.id;
                }

                //Smart Table
                $scope.irrigationDetails = [];
                $scope.irrigationDeletes = [];

                detail();
                $scope.loading = false;
                function detail() {
                    if ($scope.irrigation_id > 0) {
                        var params = {
                            params: {
                                'limit': 0,
                                'ordering': "id"
                            }
                        };
                        $scope.loading = true;
                        IrrService.detail($scope.irrigation_id, params, function (result, response, status) {
                            $scope.loading = false;
                            if (result === true) {
                                $scope.irrigationDetails = response.data;
                            } else {
                                console.log(response);
                            }
                        });
                    }
                }

                $scope.showDevice = function (irrigation) {
                    var selected = [];
                    if (irrigation.device_id) {
                        selected = $filter('filter')($scope.lstDevice, {id: irrigation.device_id});
                    }
                    return selected.length ? selected[0].code : 'Not set';
                };

                $scope.showPort = function (irrigation) {
                    if (irrigation.port !== null) {
                        return "Cổng " + (irrigation.port + 1);
                    }
                    return "";
                }
                $scope.changeDevice = function (irrigation, device_id) {
                    $scope.lstPort = [
                        {"id": 0, "label": "Cổng 1"},
                        {"id": 1, "label": "Cổng 2"},
                        {"id": 2, "label": "Cổng 3"},
                        {"id": 3, "label": "Cổng 4"},
                    ];
                    var selected = [];
                    if (device_id) {
                        selected = $filter('filter')($scope.lstDevice, {id: device_id});
                        if (selected.length) {
                            $scope.lstPort = [];
                            var device = selected[0];
                            var stt = 0;
                            if (device.ports && device.ports.length > 0) {
                                angular.forEach(device.ports, function (obj) {
                                    $scope.lstPort[stt] = {"id": stt, "label": "Cổng " + (++stt)};
                                });
                            }
                        }
                        irrigation.device_id = device_id;
                    }
                }

                $scope.changePort = function (irrigation, port) {
                    irrigation.port = port;
                    console.log(irrigation);
                }

                $scope.cancelAdd = function (rowform, index, irrigation) {
                    rowform.$cancel();
                    $scope.removeIrr(index, irrigation);
                };

                $scope.removeIrr = function (index, irrigation) {
                    $scope.irrigationDetails.splice(index, 1);
                    if (irrigation.id > 0) {
                        $scope.irrigationDeletes.push(irrigation.id);
                    }
                    console.log($scope.irrigationDeletes);
                };

                $scope.addIrr = function () {
                    $scope.inserted = {
                        id: (0 - ($scope.irrigationDetails.length + 1)),
                        irrigation_id: $scope.irrigation_id,
                        device_id: 0,
                        device_code: '',
                        step: "12",
                        port: 1,
                        condition: 0,
                        weight: 0,
                        from: "00:00:01",
                        time: 50,
                        to: "00:00:51",
                    };
                    $scope.irrigationDetails.push($scope.inserted);
                };

                editableOptions.theme = 'bs3';
                editableThemes['bs3'].submitTpl = '<button type="submit" class="btn btn-primary btn-with-icon"><i class="ion-checkmark-round"></i></button>';
                editableThemes['bs3'].cancelTpl = '<button type="button" ng-click="$form.$cancel()" class="btn btn-default btn-with-icon"><i class="ion-close-round"></i></button>';

                //Date picker
                $scope.open = open;
                $scope.openedStart = false;
                $scope.openedEnd = false;
                $scope.formats = ['dd/MM/yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
                $scope.format = $scope.formats[0];
                $scope.options = {
                    showWeeks: false
                };

                function open(type) {
                    if (type == 0) {
                        $scope.openedStart = true;
                    } else {
                        $scope.openedEnd = true;
                    }
                }


                //Save
                $scope.saving = false;
                $scope.save = function () {
                    $scope.myForm.code.$setValidity("exits", true);
                    if ($scope.myForm.$invalid) {
                        var ele = angular.element("[name='" + $scope.myForm.$name + "']").find('.ng-invalid:visible:first');
                        console.log(ele);
                        setTimeout(function () {
                            ele.focus();
                        }, 10);
                        return false;
                    }
                    $scope.isDirty = $scope.myForm.$dirty;
                    if (!$scope.isDirty) {
                        console.log("----isDirty----");
                        //Khong co thay doi tren form
                        $uibModalInstance.close(null);
                    }

                    $scope.saving = true;
                    var params = {
                        'irrigation': $scope.item,
                        'irrigationDetails': $scope.irrigationDetails,
                        'irrigationDeletes': $scope.irrigationDeletes,
                    };
                    IrrService.save(params, function (result, response, status) {
                        $scope.saving = false;
                        if (result === true) {
                            console.log(response);
                            var message = {
                                "type": "success",
                                "message": response.message,
                                "title": "Thành công",
                            };
                            $uibModalInstance.close(message);
                        } else {
                            if (status == constAcl.item_exits) {
                                $scope.myForm.code.$setValidity("exits", false);
//                                showError(response.error);
                            } else {
                                console.log(response);
                                showError("Lỗi hệ thống");
                            }
                        }
                    });
                }

            }
]);