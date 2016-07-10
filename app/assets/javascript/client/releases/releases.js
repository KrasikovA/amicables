angular.module('app')
.controller('ReleasesCtrl',['$scope',
'$stateParams',
'slides',
'leaf',
'releasesBack',
'releases',
'$sce',
function($scope, $stateParams, slides,leaf,releasesBack,releases,$sce){
	var self = this;
	self.releasesList = releases;
	self.releasesBack = releasesBack.image_url;
	leaf.navigate('releases',slides.slidesList);
}])
