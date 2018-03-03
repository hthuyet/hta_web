/**
 * @author thuyetlv
 * created on 18/11/2017
 */

angular.module('BlurAdmin.pages.user')
        .controller('ChangePassCtrl', function ($scope, UserService, RoleService, AclService, $uibModal, cfpLoadingBar,
                usSpinnerService, toastr, toastrConfig) {

            $scope.user = {name: "", oldPass: "", newPass: ""};

            UserService.get(function (result, response, status) {
                $scope.isLoading = false;
                console.log(response);
                if (result === true) {
                    $scope.user = response.user;
                } else {
                    console.log(response);
                }
            });


            $scope.saving = false;
            $scope.save = function () {
                $scope.saving = true;
                var params = {
                    'name': $scope.user.name,
                    'oldPass': $scope.user.oldPass,
                    'newPass': $scope.user.newPass,
                };
                UserService.update(params, function (result, response, status) {
                    $scope.myForm.oldPass.$setValidity("invalidPass", true);
                    $scope.saving = false;
                    if (result === true) {
                        console.log(response);
                        toastr["success"](response.message, "Thành công");
                    } else {
                        console.log(response);
                        toastr["error"](response.message, "Thất bại");
                        if(status == constAcl.USER_INVALID){
                            $scope.myForm.oldPass.$setValidity("invalidPass", false);
                        }
                    }
                });
            }
        });

