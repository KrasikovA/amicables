angular.module('app')
.controller('BandsCtrl',['$scope',
'$stateParams',
'slides',
'leaf',
'bands',
function($scope, $stateParams, slides,leaf,bands){
	var self = this;
	leaf.navigate('bands',slides.slidesList)
	self.bandsList = bands;
}])
