angular.module('app')
.controller('BandsCtrl',['$scope',
'$stateParams',
'slides',
'leaf',
'bands',
'bandsBack',
function($scope, $stateParams, slides,leaf,bands,bandsBack){
	var self = this;
	leaf.navigate('bands',slides.slidesList)
	self.bandsList = bands;
	self.bandsBack = bandsBack.image_url;
	console.dir(self.bandsBack)
}])
