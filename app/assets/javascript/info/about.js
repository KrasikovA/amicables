angular.module('app')
.controller('AboutCtrl',['$scope',
'$stateParams',
'slides',
'leaf',
function($scope, $stateParams, slides,leaf){
	leaf.navigate('about',slides.slidesList)
}])