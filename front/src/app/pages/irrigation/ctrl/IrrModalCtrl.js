/**
 * @author thuyetlv
 * created on 18/11/2017
 */

angular.module('BlurAdmin.pages.irrigation').controller('IrrModalCtrl', [
    '$scope', '$uibModalInstance', '$uibModal', 'IrrService', 'item', 'lstArea', 'lstDevice', 'toastr', 'toastrConfig', 'editableOptions', 'editableThemes'
            , function ($scope, $uibModalInstance, $uibModal, IrrService, item, lstArea, lstDevice, toastr, toastrConfig, editableOptions, editableThemes) {
                $scope.irrigation_id = ($scope.item && $scope.item.id) ? $scope.item.id : 0;
                $scope.item = angular.copy(item);

//                var collectionDate = '2002-04-26T09:00:00';
                if ($scope.item.from_date) {
                    var tmp = $scope.item.from_date.replace(" ", "T");
                    $scope.item.fromDate = new Date(tmp);
                } else {
                    $scope.item.fromDate = new Date();
                }

                if ($scope.item.to_date) {
                    var tmp = $scope.item.to_date.replace(" ", "T");
                    console.log("---tmp: " + tmp);
                    $scope.item.toDate = new Date(tmp);
                } else {
                    $scope.item.toDate = new Date();
                }
                console.log($scope.item.toDate);

                $scope.lstDevice = lstDevice;
                $scope.title = "Thêm mới lịch tưới";
                $scope.lstArea = lstArea;
                $scope.area = {};

                console.log($scope.lstArea);
                if ($scope.item) {
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


                function showError(message) {
                    $("#myAlert").removeClass('bg-danger');
                    $("#myAlert").removeClass('bg-success');
                    $("#myAlert").addClass('bg-danger');
                    $("#alertContent").html(message);
                    $("#myAlert").show();
                }

                $scope.saving = false;
                $scope.save = function () {
                    $scope.isDirty = $scope.myForm.$dirty;
                    if (!$scope.isDirty) {
                        //Khong co thay doi tren form
                        $uibModalInstance.close(null);
                    }

                    $scope.saving = true;
                    var params = {
                        'id': $scope.item.id,
                        'username': $scope.item.username,
                        'email': $scope.item.email,
                        'name': $scope.item.name,
                        'role_id': $scope.roleSelect.id,
                    };
                    IrrService.save(params, function (result, response, status) {
                        $scope.saving = false;
                        if (result === true) {
                            console.log(response);
                            var message = {
                                "type": "success",
                                "message": response.message,
                                "title": "Thành công: ",
                            };
                            $uibModalInstance.close(message);
                        } else {
                            console.log(response);
                            showError("Lỗi hệ thống");
                        }
                    });
                }

                //Smart Tables
                $scope.irrigationDetails = [];

                detail();
                function detail() {
                    if ($scope.irrigation_id > 0) {
                        var params = {
                            params: {
                                'limit': 0,
                                'ordering': "-id"
                            }
                        };
                        IrrService.detail($scope.irrigation_id, params, function (result, response, status) {
                            if (result === true) {
                                $scope.irrigationDetails = response.data;
                            } else {
                                console.log(response);
                            }
                        });
                    }
                }

                $scope.groups = [
                    {id: 1, text: 'user'},
                    {id: 2, text: 'customer'},
                    {id: 3, text: 'vip'},
                    {id: 4, text: 'admin'}
                ];

                $scope.removeUser = function (index) {
                    $scope.irrigationDetails.splice(index, 1);
                };

                $scope.addUser = function () {
                    $scope.inserted = {
                        id: $scope.irrigationDetails.length + 1,
                        irrigation_id: $scope.irrigation_id,
                        device_id: 11,
                        device_code: '',
                        step: "",
                        port: 0,
                        condition: 0,
                        weight: 0,
                        from: "",
                        time: 0,
                        to: "",
                    };
                    $scope.irrigationDetails.push($scope.inserted);
                    console.log($scope.irrigationDetails);
                };

                editableOptions.theme = 'bs3';
                editableThemes['bs3'].submitTpl = '<button type="submit" class="btn btn-primary btn-with-icon"><i class="ion-checkmark-round"></i></button>';
                editableThemes['bs3'].cancelTpl = '<button type="button" ng-click="$form.$cancel()" class="btn btn-default btn-with-icon"><i class="ion-close-round"></i></button>';

                //Date picker
                $scope.open = open;
                $scope.opened = false;
                $scope.formats = ['dd/MM/yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
                $scope.format = $scope.formats[0];
                $scope.options = {
                    showWeeks: false
                };

                function open() {
                    $scope.opened = true;
                }
            }
]);