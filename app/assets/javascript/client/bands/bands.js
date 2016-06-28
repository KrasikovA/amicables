angular.module('app')
.controller('BandsCtrl',['$scope',
'$stateParams',
'slides',
'leaf',
'bands',
'bandsBack',
'$http',
function($scope, $stateParams, slides,leaf,bands,bandsBack,$http){
	var self = this;
	leaf.navigate('bands',slides.slidesList)
	self.bandsList = bands;
	self.selectedBand = {};
	self.bandsBack = bandsBack.image_url;
}])
