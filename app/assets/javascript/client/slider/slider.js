angular.module('app')
.directive('slider', function(leaf,slides,$location,$state,$rootScope) {
  return {
    restrict: 'A',
    transclude: true,
    scope: { },
    templateUrl: 'client/slider/_slider.html',
    bindToController: true,
    controllerAs: 'slider',
    controller: function() {
    	var self = this;
        self.selectedSlide = null;
        self.slides = slides.slidesList;
    	self.addSlide = function addSlide(slide) {
		  slides.slidesList.push(slide)
		};

        self.selectSlide = function(slide){
            if (!slide.slideRight){
                $state.go(slide.page)
            }else{
                $state.go(leaf.getRighter(slide,slides.slidesList))
            }
        }
    }
  }
})
.directive('slide',function(){
    return {
    restrict: 'E',
    transclude: true,
    require: '^slider',
    scope: {
        heading: '@',
        page: '@'
    },
    link: function(scope, elem, attr,sliderCtrl) {
        scope.active = false;
        scope.slideRight = false;
        scope.slideLeft = false;
        sliderCtrl.addSlide(scope);
    }
  }
})