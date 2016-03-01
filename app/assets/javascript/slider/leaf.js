angular.module('app')
.service('leaf',function($location){
    var self = this;
    self.prev = function(slide,slides){
                slideIndex = slides.indexOf(slide) - 1;
                for (var i = slideIndex;i > -1;i-- ){
                    if(slides[i].slideRight){
                        slides[i].slideLeft = true;
                    }
                    slides[i].slideRight = false;
                }
            };

    self.next = function(slide,slides){
                slideIndex = slides.indexOf(slide);
                for (var i = slideIndex;i < slides.length;i++ ){
                    slides[i].slideRight = true;
                    slides[i].slideLeft = false;
                }
            };

    self.getRighter = function(slide,slides){
        slideIndex = slides.indexOf(slide)
        if (slideIndex === slides.length - 1) {
            return "home";
        }else{
            return slides[slideIndex + 1].page;
        }
    }

    self.navigate = function(slide,slides){
        if (typeof slide  === "string"){
            if (slide === "home"){
                slides.forEach(function(s){
                    s.slideRight = false;
                    s.slideLeft = true;
                })
                $location.url("home")
                return   
            }
            slideObject = slides.find(function(el){
                return el.heading == slide;
            })
        }else{
            slideObject = slide;
        }
        if (slideObject.slideRight){
            self.prev(slideObject,slides)
        }else{
            self.next(slideObject,slides)
        }
    }
})