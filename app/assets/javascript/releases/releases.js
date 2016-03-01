angular.module('app')
.controller('ReleasesCtrl',['$scope',
'$stateParams',
'slides',
'leaf',
function($scope, $stateParams, slides,leaf){
	leaf.navigate('releases',slides.slidesList)
}])