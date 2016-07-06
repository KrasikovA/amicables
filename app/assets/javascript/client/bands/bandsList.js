angular.module('app')
.controller('BandsList',['$scope',
'$stateParams',
'currentBand',
'controllerBridge',
function($scope, $stateParams,currentBand,controllerBridge){
	var self = this;
	controllerBridge.value = $stateParams.bandId;
	$scope.currentBandImages = currentBand.band_images;
	self.currentBand = currentBand;
}])
