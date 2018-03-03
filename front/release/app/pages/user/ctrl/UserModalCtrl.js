/**
 * @author thuyetlv
 * created on 18/11/2017
 */

angular.module('BlurAdmin.pages.user').controller('UserModalCtrl', [
    '$scope', '$uibModalInstance', '$uibModal', 'UserService', 'item', 'lstRole', 'toastr', 'toastrConfig'
            , function ($scope, $uibModalInstance, $uibModal, UserService, item, lstRole, toastr, toastrConfig) {
                $scope.item = angular.copy(item);
                $scope.lstRole = lstRole;
                $scope.roleSelect = {};
                $scope.title = "Thêm mới người dùng";
                if ($scope.item) {
                    $scope.title = "Cập nhật thông tin người dùng";
                    if (lstRole) {
                        lstRole.forEach(function (obj) {
                            if (obj.id == $scope.item.role_id) {
                                $scope.roleSelect = obj;
                            }
                        });
                    }
                }

                if (lstRole && lstRole.length == 1 && !$scope.roleSelect) {
                    $scope.roleSelect = lstRole[0];
                }


                function showError(message) {
                    $("#myAlert").removeClass('bg-danger');
                    $("#myAlert").removeClass('bg-success');
                    $("#myAlert").addClass('bg-danger');
                    $("#alertContent").html(message);
                    $("#myAlert").show();
                }

                $scope.onChange = function (item) {
                    $scope.roleSelect = item;
                    console.log($scope.roleSelect);
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
                    UserService.save(params, function (result, response, status) {
                        $scope.myForm.username.$setValidity("exits", true);
                        $scope.myForm.email.$setValidity("exits", true);
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
                            if (status == constAcl.item_exits) {
                                if (response.code == "username") {
                                    $scope.myForm.username.$setValidity("exits", false);
                                } else if (response.code == "email") {
                                    $scope.myForm.email.$setValidity("exits", false);
                                } else {
                                    showError(response.message);
                                }
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