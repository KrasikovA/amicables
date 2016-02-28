angular.module('app')
.config([
'$stateProvider',
'$urlRouterProvider',
function($stateProvider, $urlRouterProvider) {

  $stateProvider
    .state('home', {
      url: '/home',
      templateUrl: 'home/_home.html',
      controller: 'MainCtrl'
    })
    .state('about', {
      url: '/about',
      templateUrl: 'about/_about.html',
      controller: 'MainCtrl'
    })
    .state('bands', {
      url: '/bands',
      templateUrl: 'bands/_bands.html',
      controller: 'MainCtrl'
    })
    .state('releases', {
      url: '/releases',
      templateUrl: 'releases/_releases.html',
      controller: 'MainCtrl'
    });

  $urlRouterProvider.otherwise('home');
}])
.controller('MainCtrl', function() {
  var self = this;
  self.message = "The app routing is working!";
});