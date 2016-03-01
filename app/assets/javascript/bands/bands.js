angular.module('app')
.controller('BandsCtrl',['$scope',
'$stateParams',
'slides',
'leaf',
function($scope, $stateParams, slides,leaf){
	leaf.navigate('bands',slides.slidesList)
}])