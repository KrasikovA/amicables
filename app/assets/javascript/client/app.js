angular.module('app',
	['ui.router',
	'templates',
	'ngAnimate',
	'ngSanitize',
	'com.2fdevs.videogular',
	'com.2fdevs.videogular.plugins.controls'
	])
.value('slides',{
	slidesList : []
})