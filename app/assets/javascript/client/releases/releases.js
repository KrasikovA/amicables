angular.module('app')
.controller('ReleasesCtrl',['$scope',
'$stateParams',
'slides',
'leaf',
'releasesBack',
'releases',
'$sce',
function($scope, $stateParams, slides,leaf,releasesBack,releases,$sce){
	var self = this;
	self.bands = releases;
	self.bands.forEach(function(band){
		band.releases.forEach(function(release){
			release.tracks.forEach(function(track){
				track.songs = [
					{src: $sce.trustAsResourceUrl(track.song_url),type: "audio/mpeg"}
				]
			})
		})
	})
	self.theme = {
          url: "http://www.videogular.com/styles/themes/default/latest/videogular.css"
	}
	self.releasesBack = releasesBack.image_url
	leaf.navigate('releases',slides.slidesList)
}])