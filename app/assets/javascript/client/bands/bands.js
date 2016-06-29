angular.module('app')
.controller('BandsCtrl',['$scope',
'$stateParams',
'slides',
'leaf',
'bands',
'bandsBack',
'$http',
'controllerBridge',
function($scope, $stateParams, slides,leaf,bands,bandsBack, $http, controllerBridge){
	var self = this;
	leaf.navigate('bands',slides.slidesList);
	self.bandsList = bands;
	self.selectedBand = {};
	self.bandsBack = bandsBack.image_url;
	controllerBridge.value = undefined;
	self.isSelected = function(band){
		return band.id == controllerBridge.value;
	}
}])
