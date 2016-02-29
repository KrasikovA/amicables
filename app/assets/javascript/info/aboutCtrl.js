angular.module('app')
.controller('AboutCtrl',['$scope',
'$stateParams',
'slides',
'leaf',
function($scope, $stateParams, slides,leaf){
	aboutSlide = slides.slidesList.find(function(el){
		return el.heading == 'about';
	})
	leaf.next(aboutSlide,slides.slidesList)
}])