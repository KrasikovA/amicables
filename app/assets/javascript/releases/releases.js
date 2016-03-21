angular.module('app')
.controller('ReleasesCtrl',['$scope',
'$stateParams',
'slides',
'leaf',
'releases',
function($scope, $stateParams, slides,leaf,releases){
	leaf.navigate('releases',slides.slidesList)
}])