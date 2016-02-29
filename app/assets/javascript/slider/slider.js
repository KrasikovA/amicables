angular.module('app')
.directive('slider', function(leaf,slides) {
  return {
    restrict: 'E',
    transclude: true,
    scope: { },
    templateUrl: 'slider/_slider.html',
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
            if (slide.slideRight){
                leaf.prev(slide,slides.slidesList)
            }else{
                leaf.next(slide,slides.slidesList)
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