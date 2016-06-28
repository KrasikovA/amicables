angular.module('app')
.controller('BandsList',['$scope',
'$stateParams',
'currentBand',
function($scope, $stateParams,currentBand){
	var self = this;
	self.currentBand = currentBand;
}])
