angular.module('app')
.directive('slide',function(){
	return {
    restrict: 'E',
    transclude: true,
    templateUrl: 'slider/_slide.html',
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
.directive('slider', function(leaf,$location,slides) {
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
            $location.url(slide.page)
        }
    }
  }
})
.service('leaf',function(){
    var self = this;
    self.prev = function(slide,slides){
                slideIndex = slides.indexOf(slide);
                for (var i = slideIndex;i > -1;i-- ){
                    if(slides[i].slideRight){
                        slides[i].slideLeft = true;
                    }
                    slides[i].slideRight = false;
                }
                if (slideIndex + 1 < slides.length){
                    slides[slideIndex + 1].active = true;
                }
            };
    self.next = function(slide,slides){
                slideIndex = slides.indexOf(slide);
                for (var i = slideIndex;i < slides.length;i++ ){
                    slides[i].slideRight = true;
                    slides[i].slideLeft = false;
                }
                if (slideIndex + 1 < slides.length){
                    slides[slideIndex + 1].active = false;
                }
            };
})