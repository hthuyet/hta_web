/**
 * @author thuyetlv
 * created on 18/11/2017
 */

angular.module('BlurAdmin.pages.device')
        .controller('DeviceCtrl', function ($scope, DeviceService, AclService, $uibModal, cfpLoadingBar,
                usSpinnerService, DeviceTypeService, toastr, toastrConfig, UserService, myWebsocket, $timeout) {
            $scope.device_manage = AclService.can(constAcl.device_manage);
            $scope.device_control = AclService.can(constAcl.device_control);
            //paging
            $scope.AclService = AclService;
            $scope.constAcl = constAcl;
            $scope.isLoading = false;
            $scope.pagination = {
                currentPage: 1,
                maxSize: 5,
                totalItems: 0,
                itemPerPage: 10,
            };
            $scope.search = "";
            $scope.data = [];

            var timeBlink = 10000;

            loadData();

            $scope.initSocket = true;
            function loadData() {
                $scope.isLoading = true;
                var params = {
                    params: {
                        'page': $scope.pagination.currentPage,
                        'limit': $scope.pagination.itemPerPage,
                        'search': $scope.search,
                        'ordering': "id"
                    }
                };
                DeviceService.loadData(params, function (result, response, status) {
                    var listDevice = "";
                    $scope.isLoading = false;
                    if (result === true) {
                        $scope.data = [];
                        angular.forEach(response.data, function (obj) {
                            listDevice += obj.code + ",";
                            $scope.data.push(parseLstPort(obj));
                        });
                        $scope.pagination.totalItems = response.total;
                        if ($scope.initSocket) {
                            myWebsocket.open(listDevice, function (device) {
                                console.log(device.portStatus);
                                angular.forEach($scope.data, function (obj) {
                                    if (device.code == obj.code) {
                                        $("#" + obj.code).removeClass("blink");
                                        $("#" + obj.code).addClass("blink");
                                        obj.port_status = "" + device.portStatus;
                                        parseLstPort(obj);
                                        $timeout(function () {
                                            $("#" + obj.code).removeClass("blink");
                                        }, timeBlink);
                                    }
                                });
                            });
                        } else {
                            myWebsocket.sendMessage(listDevice, function (device) {
                                console.log(device.portStatus);
                                angular.forEach($scope.data, function (obj) {
                                    if (device.code == obj.code) {
                                        $("#" + obj.code).removeClass("blink");
                                        $("#" + obj.code).addClass("blink");
                                        obj.port_status = "" + device.portStatus;
                                        parseLstPort(obj);
                                        $timeout(function () {
                                            $("#" + obj.code).removeClass("blink");
                                        }, timeBlink);
                                    }
                                });
                            });
                        }
                        $scope.initSocket = false;
                    } else {
                        console.log(response);
                    }
                });
            }

            $scope.pageChanged = function () {
                console.log('Page changed to: ' + $scope.pagination.currentPage);
                loadData();
            };

////        $scope.$watch("currentPage + search", function () {
//        $scope.$watch("currentPage", function () {
//            console.log($scope.search);
//            var begin = (($scope.currentPage - 1) * $scope.numPerPage)
//                    , end = begin + $scope.numPerPage;
//        });

            $scope.searchDevice = function () {
                loadData();
            }

            $scope.$watch('search', function (newVal, oldVal) {
                if (angular.isDefined(newVal) && newVal !== oldVal) {
                    $scope.searchDevice();
                }
            });

            //Loading
            $scope.start = function () {
                usSpinnerService.spin('spinner-1');
                cfpLoadingBar.start();
            };

            //Load Data
            $scope.lstDeviceType = [];
            $scope.lstUser = [];
            if ($scope.device_manage) {
                DeviceTypeService.loadData({}, function (result, response, status) {
                    if (result === true) {
                        $scope.lstDeviceType = response;
                    } else {
                        console.log(response);
                    }
                });
                UserService.loadData({}, function (result, response, status) {
                    if (result === true) {
                        $scope.lstUser = response;
                    } else {
                        console.log(response);
                    }
                });
            }

            function parseLstPort(item) {
                var lstPort = JSON.parse(item.port_status);
                var arr = [];
                if (lstPort && lstPort.length > 0) {
                    var stt = 0;
                    lstPort.forEach(function (obj) {
                        if (obj == 1 || obj == "1") {
                            arr.push({"key": "port_" + stt++, "value": true});
                        } else {
                            arr.push({"key": "port_" + stt++, "value": false});
                        }
                    });
                }
                item["jsonPort"] = arr;
                return item;
            }

            //Action
            $scope.delete = function (item) {
                cfpLoadingBar.start();
                DeviceService.remove(item.id, function (result, response, status) {
                    cfpLoadingBar.complete();
                    if (result === true) {
                        loadData();
                    } else {
                        console.log(response);
                    }
                });
            };

            $scope.add = function () {
                $scope.open(null, 'DeviceModalCtrl as ctrl', 'app/pages/device/view/edit.html', 'lg');
            };
            $scope.edit = function (item) {
                $scope.open(item, 'DeviceModalCtrl as ctrl', 'app/pages/device/view/edit.html', 'lg');
            };
            $scope.updatePort = function (item) {
                $scope.open(item, 'DevicePortModalCtrl as ctrl', 'app/pages/device/view/updatePort.html', 'lg');
            };
            $scope.control = function (item) {
                if (constAcl.CONTROL_ONLINE) {
                    DeviceService.getPortStatus(item.id, function (result, response, status) {
                        var msg = "";
                        if (result === true) {
                            console.log(response);
                            if (response.data.errorCode == '0') {
                                item.canTimer = response.data.canTimer;
                                var lstPort = response.data.ports;
                                var switches = [];
                                if (lstPort && lstPort.length > 0) {
                                    var stt = 0;
                                    lstPort.forEach(function (obj) {
                                        switches[stt] = {
                                            "id": (stt),
                                            "label": "Cổng " + (++stt),
                                            "status": (obj == "1"),
                                            "value": parseInt(obj),
                                            "number": 0,
                                        };
                                    });
                                }
                                item.switches = switches;
                            } else {
                                msg = "Không lấy được thông tin của thiết bị!";
                            }
                        } else {
                            msg = "Không lấy được thông tin của thiết bị!";
                            var data = response.data;
                            item.canTimer = data.canTimer;
                            var switches = [];
                            var lstPort = data.ports;
                            if (lstPort && lstPort.length > 0) {
                                var stt = 0;
                                lstPort.forEach(function (obj) {
                                    switches[stt] = {
                                        "id": (stt),
                                        "label": "Cổng " + (++stt),
                                        "status": false,
                                        "value": 2,
                                        "number": 0,
                                    };
                                });
                            }
                            item.switches = switches;
                        }
                        $scope.open(item, 'ControlDeviceCtrl as ctrl', 'app/pages/device/view/control.html', 'lg', msg);
                    });
                } else {
                    var switches = [];
                    var lstPort = item.ports;
                    if (lstPort && lstPort.length > 0) {
                        var stt = 0;
                        lstPort.forEach(function (obj) {
                            switches[stt] = {
                                "id": (stt),
                                "label": "Cổng " + (++stt),
                                "status": false,
                                "value": 2,
                                "number": 0,
                            };
                        });
                    }
                    item.switches = switches;
                    $scope.open(item, 'ControlDeviceCtrl as ctrl', 'app/pages/device/view/control.html', 'lg', "");
                }

            };
            $scope.deviceSchedule = function (item) {
                $scope.open(item, 'DeviceScheduleCtrl as ctrl', 'app/pages/device/view/deviceSchedule.html', 'lg');
            };
            $scope.history = function (item) {
                $scope.open(item, 'HistoryCtrl as ctrl', 'app/pages/device/view/history.html', 'lg');
            };
            $scope.lstDeviceSchedule = function (item) {
                $scope.open(item, 'ListDeviceScheduleCtrl as ctrl', 'app/pages/device/view/deviceScheduleIdx.html', 'full');
            };
            $scope.listServer = function (item) {
                $scope.open(item, 'ListScheServer as ctrl', 'app/pages/device/view/lstSchedule.html', 'full');
            };

            $scope.testBlink = function (item) {
//                $scope.$apply(function ($scope) {
                $("#" + item.code).removeClass("blink");
                if (item.port_status.indexOf("1") >= 0) {
                    item.port_status = "[0,0,0,0]";
                    item.state = 0;
                } else {
                    $("#" + item.code).addClass("blink");
                    item.port_status = "[1,1,1,1]";
                    item.state = 1;
                }
                parseLstPort(item);
//                });
            };

            //Open modal
            $scope.open = function (item, ctrl, page, size, msg) {
                var modalInstance = $uibModal.open({
                    animation: true,
                    templateUrl: page,
                    controller: ctrl,
                    size: size,
                    resolve: {
                        item: function () {
                            return item;
                        },
                        lstDeviceType: function () {
                            return $scope.lstDeviceType;
                        },
                        lstUser: function () {
                            return $scope.lstUser;
                        },
                        msg: function () {
                            return msg;
                        }
                    }
                });
                modalInstance.result.then(function (message, reload) {
                    console.log("sumbited value inside parent controller", message);
                    if (message != null) {
                        toastr[message.type](message.message, message.title);
                        if (message.reload || reload) {
                            loadData();
                        }
                    }
                })
            };

        }
        );

