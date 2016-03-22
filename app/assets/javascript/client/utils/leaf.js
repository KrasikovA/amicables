angular.module('app')
.service('leaf',function($location,slides,$state){
    var self = this;
    self.prev = function(slide,slidesList){
                slideIndex = slidesList.indexOf(slide) - 1;
                for (var i = slideIndex;i > -1;i-- ){
                    if(slidesList[i].slideRight){
                        slidesList[i].slideLeft = true;
                    }
                    slidesList[i].slideRight = false;
                }
            };

    self.next = function(slide,slidesList){
                slideIndex = slidesList.indexOf(slide);
                for (var i = slideIndex;i < slidesList.length;i++ ){
                    slidesList[i].slideRight = true;
                    slidesList[i].slideLeft = false;
                }
            };

    self.getRighter = function(slide,slidesList){
        slideIndex = slidesList.indexOf(slide)
        if (slideIndex === slidesList.length - 1) {
            return "home";
        }else{
            return slidesList[slideIndex + 1].page;
        }
    }

    self.navigate = function(slide,slidesList){
        if (typeof slide  === "string"){
            if (slide === "home"){
                slidesList.forEach(function(s){
                    s.slideRight = false;
                    s.slideLeft = true;
                })
                $state.go("home")
                return   
            }
            slideObject = slidesList.find(function(el){
                return el.heading == slide;
            })
        }else{
            slideObject = slide;
        }
        if (slideObject.slideRight){
            self.prev(slideObject,slidesList)
        }else{
            self.next(slideObject,slidesList)
        }
    }
})