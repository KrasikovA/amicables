angular.module('app')
.directive('player',['$state',function($state){
	return {
		templateUrl:"player/_player.html",
		restrict: 'A',
	    transclude: true,
	    scope: { },
	    bindToController: true,
	    controllerAs: 'player',
	    controller : function(){
	    	var self = this;
	    	self.title = "amicables";
	    	self.home = function(){
	    		$state.go('home')
	    	}
	    }
	}
}])