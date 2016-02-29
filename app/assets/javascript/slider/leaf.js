angular.module('app')
.service('leaf',function($location){
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
                    $location.url(slides[slideIndex + 1].page)
                }else{
                    $location.url('home')
                }
            };
    self.next = function(slide,slides){
                slideIndex = slides.indexOf(slide);
                for (var i = slideIndex;i < slides.length;i++ ){
                    slides[i].slideRight = true;
                    slides[i].slideLeft = false;
                }
                $location.url(slide.page)
            };
})