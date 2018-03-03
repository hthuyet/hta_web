/**
 * @author v.lugovksy
 * created on 16.12.2015
 */
(function () {
    'use strict';

    angular.module('BlurAdmin.pages.dashboard')
            .controller('TrafficChartCtrl', TrafficChartCtrl);

    /** @ngInject */
    function TrafficChartCtrl($scope, baConfig, colorHelper, DeviceService) {


        $scope.total = 0;
        $scope.transparent = baConfig.theme.blur;
        var dashboardColors = baConfig.colors.dashboard;
        
        DeviceService.statics(function (result, response, status) {
            var dataStatic = response.data;
            $scope.total = response.total;
            $scope.doughnutData = {
                labels: [
                    dataStatic[0].label,
                    dataStatic[1].label
                ],
                datasets: [
                    {
                        data: [dataStatic[0].value, dataStatic[1].value],
                        backgroundColor: [
                            dashboardColors.white,
                            dashboardColors.gossip
                        ],
                        hoverBackgroundColor: [
                            colorHelper.shade(dashboardColors.white, 15),
                            colorHelper.shade(dashboardColors.gossip, 15)
                        ],
                        percentage: [(dataStatic[0].value/response.total)*100, (dataStatic[1].value/response.total)*100]
                    }]
            };

            var ctx = document.getElementById('chart-area').getContext('2d');
            window.myDoughnut = new Chart(ctx, {
                type: 'doughnut',
                data: $scope.doughnutData,
                options: {
                    cutoutPercentage: 64,
                    responsive: true,
                    elements: {
                        arc: {
                            borderWidth: 0
                        }
                    }
                }
            });
            console.log(response);
        });
    }
})();