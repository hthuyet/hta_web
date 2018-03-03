/**
 * @author thuyetlv
 * created on 18/11/2017
 */

angular.module('BlurAdmin.pages.device').controller('DevicePortModalCtrl', [
    '$scope', '$uibModalInstance', '$uibModal', 'DeviceService', 'AreaService', 'item', 'toastr',
    'toastrConfig', '$filter', 'editableOptions', 'editableThemes'
            , function ($scope, $uibModalInstance, $uibModal, DeviceService, AreaService, item, toastr, toastrConfig,
                    $filter, editableOptions, editableThemes) {
                $scope.device_id = (item && item.id) ? item.id : 0;
                $scope.item = (item != null) ? angular.copy(item) : {};


                //Smart Table
                $scope.portInfos = [];

                detail();
                $scope.loading = false;
                function detail() {
                    if ($scope.device_id > 0) {
                        $scope.loading = true;
                        DeviceService.portInfo($scope.device_id, function (result, response, status) {
                            $scope.loading = false;
                            if (result === true) {
                                $scope.portInfos = response.data;
                            } else {
                                console.log(response);
                            }
                        });
                    }
                }

                //---------------------------
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


                $scope.showArea = function (portInfo) {
                    var selected = [];
                    if (portInfo.area_id) {
                        selected = $filter('filter')($scope.lstArea, {id: portInfo.area_id});
                    }
                    return selected.length ? (selected[0].code + " - " + selected[0].name) : 'Not set';
                };

                $scope.changeArea = function (portInfo, area) {
                    portInfo.area_id = area;
                }

                $scope.cancelAdd = function (rowform, index, irrigation) {
                    rowform.$cancel();
                };

                editableOptions.theme = 'bs3';
                editableThemes['bs3'].submitTpl = '<button type="submit" class="btn btn-primary btn-with-icon"><i class="ion-checkmark-round"></i></button>';
                editableThemes['bs3'].cancelTpl = '<button type="button" ng-click="$form.$cancel()" class="btn btn-default btn-with-icon"><i class="ion-close-round"></i></button>';


                //Save
                $scope.saving = false;
                $scope.save = function () {
                    $scope.saving = true;
                    var params = {
                        'portInfos': $scope.portInfos
                    };
                    DeviceService.savePortInfo($scope.device_id, params, function (result, response, status) {
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
                            console.log(response);
                            showError("Lỗi hệ thống");
                        }
                    });
                }

            }
]);