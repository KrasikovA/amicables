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
    	scope.active = false;
        scope.slideRight = false;
    	sliderCtrl.addSlide(scope);
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
    	var self = this;
    	self.slides = [];
        self.selectedSlide = null;

    	self.addSlide = function addSlide(slide) {
		  self.slides.push(slide)
		};

        self.selectSlide = function(slide){
            slideIndex = self.slides.indexOf(slide);
            if (slide.slideRight){
                for (var i = slideIndex;i > -1;i-- ){
                    self.slides[i].slideRight = false;
                }
            }else{
                for (var i = slideIndex;i < self.slides.length;i++ ){
                    self.slides[i].slideRight = true;
                }
            }
        }
    }
  }
})