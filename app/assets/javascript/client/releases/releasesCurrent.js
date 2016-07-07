angular.module('app')
.controller('ReleasesCurrentCtrl',['$scope',
'$stateParams',
'$sce',
'currentBand',
function($scope,$stateParams,$sce,currentBand){
	console.log(currentBand)
}])