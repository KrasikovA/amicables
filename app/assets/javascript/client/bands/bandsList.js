angular.module('app')
.controller('BandsList',['$scope',
'$stateParams',
'currentBand',
'currentBandImages',
'controllerBridge',
function($scope, $stateParams,currentBand,currentBandImages,controllerBridge){
	var self = this;
	controllerBridge.value = $stateParams.bandId;
	$scope.currentBandImages = currentBandImages;
	self.currentBand = currentBand;
}])
