/**
 * @author thuyetlv
 * created on 18/11/2017
 */

angular.module('BlurAdmin.pages.area').controller('AreaModalCtrl', [
    '$scope', '$uibModalInstance', '$uibModal', 'AreaService', 'item', 'toastr', 'toastrConfig'
            , function ($scope, $uibModalInstance, $uibModal, AreaService, item, toastr, toastrConfig) {
                $scope.item = angular.copy(item);
                $scope.roleSelect = {};
                $scope.title = "Thêm mới khu vực";
                if ($scope.item) {
                    $scope.title = "Cập nhật thông tin khu vực";
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
                    $scope.myForm.code.$setValidity("exits", true);
                    $scope.isDirty = $scope.myForm.$dirty;
                    if (!$scope.isDirty) {
                        //Khong co thay doi tren form
                        $uibModalInstance.close(null);
                    }

                    $scope.saving = true;
                    var params = {
                        'id': $scope.item.id,
                        'code': $scope.item.code,
                        'name': $scope.item.name
                    };
                    AreaService.save(params, function (result, response, status) {
                        $scope.saving = false;
                        if (result === true) {
                            var message = {
                                "type": "success",
                                "message": response.message,
                                "title": "Thành công",
                                "reload": true
                            };
                            $uibModalInstance.close(message);
                        } else {
                            if (status == constAcl.item_exits) {
                                $scope.myForm.code.$setValidity("exits", false);
                                showError(response.message);
                            } else {
                                if (response.message) {
                                    showError(response.message);
                                } else {
                                    showError(constAcl.errorMsg);
                                }
                            }
                        }
                    });
                }


            }
]);