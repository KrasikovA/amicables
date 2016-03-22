angular.module('app')
.controller('HomeCtrl',['$scope',
'$stateParams',
'slides',
'leaf',
function($scope, $stateParams, slides,leaf){
	leaf.navigate('home',slides.slidesList);
}])