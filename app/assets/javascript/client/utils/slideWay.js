angular.module('app')
.directive('slideWay',['$rootScope','slides',function($rootScope,slides,element){
	return {
		link : function(scope, elem, attr,sliderCtrl){
			$rootScope.$on('$stateChangeStart', 
			function(event, toState, toParams, fromState, fromParams, options){ 
				var slidesList = slides.slidesList,
					toStateIndex = slidesList.indexOf(slidesList.find(function(slide){return slide.page === toState.name.match(/[^.]*/)[0]})),
					fromStateIndex = slidesList.indexOf(slidesList.find(function(slide){return slide.page === fromState.name.match(/[^.]*/)[0]}));
				if (toState.name == 'home' || (Math.abs(fromStateIndex) < toStateIndex) && fromStateIndex != -1){
					elem.addClass("slideLeft")
					elem.removeClass("noAnimation")
				}else {
					elem.removeClass("slideLeft noAnimation")
				}
				if (fromState.abstract){
					elem.addClass("noAnimation");
				}
			})
		}
	}
}])