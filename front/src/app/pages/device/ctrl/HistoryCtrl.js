/**
 * @author thuyetlv
 * created on 18/11/2017
 */

angular.module('BlurAdmin.pages.device').controller('HistoryCtrl', [
    '$scope', '$uibModalInstance', '$uibModal', 'DeviceService', 'item', 'AclService', 'toastr', 'toastrConfig'
            , function ($scope, $uibModalInstance, $uibModal, DeviceService, item, AclService,
                    toastr, toastrConfig) {
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
                            'id': $scope.device.id,
                            'page': $scope.pagination.currentPage,
                            'limit': $scope.pagination.itemPerPage,
                        }
                    };
                    DeviceService.history($scope.device.id, params, function (result, response, status) {
                        $scope.isLoading = false;
                        if (result === true) {
                            $scope.data = response.data;
                            $scope.pagination.totalItems = response.total;
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

            }
]);