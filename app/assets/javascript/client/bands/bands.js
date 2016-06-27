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
	self.bandsBack = bandsBack.image_url;
	self.selectBand = function(id){
		self.activeBand = id;
	}
}])
