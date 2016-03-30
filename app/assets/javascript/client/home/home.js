angular.module('app')
.controller('HomeCtrl',['$scope',
'$stateParams',
'slides',
'leaf',
'homeBack',
function($scope, $stateParams, slides,leaf,homeBack){
	var self = this;
	self.homeBack = homeBack.image_url;
	leaf.navigate('home',slides.slidesList);
}])