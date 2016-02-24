angular.module('app')
.directive('slide',function(){
	return {
    restrict: 'E',
    transclude: true,
    templateUrl: 'slider/_slide.html',
    require: '^slider',
    scope: {
    	heading: '@'
    },
    link: function(scope, elem, attr,sliderCtrl) {
    	scope.active = false
    	sliderCtrl.addSlide(scope)
    }
  }
})
.directive('slider', function() {
  return {
    restrict: 'E',
    transclude: true,
    scope: { },
    templateUrl: 'slider/_slider.html',
    bindToController: true,
    controllerAs: 'slider',
    controller: function() {
    	var self = this
    	self.slides = []
    	self.addSlide = function addSlide(slide) {
		  self.slides.push(slide)
		}
    }
  }
})