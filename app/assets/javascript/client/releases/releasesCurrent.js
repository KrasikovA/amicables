angular.module('app')
.controller('ReleasesCurrentCtrl',['$scope',
'$stateParams',
'$sce',
'currentBand',
function($scope,$stateParams,$sce,albums){
	var self = this;
	self.albums = albums;
	console.log(albums)
}])
