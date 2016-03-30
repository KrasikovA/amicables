angular.module('app')
.controller('ReleasesCtrl',['$scope',
'$stateParams',
'slides',
'leaf',
'releasesBack',
function($scope, $stateParams, slides,leaf,releasesBack){
	var self = this;
	self.releasesBack = releasesBack.image_url
	leaf.navigate('releases',slides.slidesList)
}])