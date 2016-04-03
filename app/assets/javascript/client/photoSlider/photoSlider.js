angular.module('app')
	.directive('photoSlider',[
		'$http',
		function($http){
		return {
    		restrict: 'A',
    		transclude: true,
    		templateUrl: 'client/photoSlider/_photoSlider.html',
    		scope: {
    		    bandId: '@'
    		},
    		link: function(scope, elem, attr,sliderCtrl) {
				scope.currentIndex = 0;
				attr.$observe('bandid',function(newBandId){
					if (newBandId.length > 0){
						$http
							.get('/api/bands/' + newBandId + '/images.json')
								.then(function(data){
									scope.images = data.data;
								})
					}
				})
		        scope.setCurrentSlideIndex = function (index) {
		            scope.currentIndex = index;
		        };
		        scope.isCurrentSlideIndex = function (index) {
		            return scope.currentIndex === index;
		        };
				scope.prevImage = function () {
		            scope.currentIndex = (scope.currentIndex < scope.images.length - 1) ? ++scope.currentIndex : 0;
		        };

		        scope.nextImage = function () {
		            scope.currentIndex = (scope.currentIndex > 0) ? --scope.currentIndex : scope.images.length - 1;
		       	};
    		}
		}
	}])