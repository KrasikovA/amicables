angular.module('app')
.config([
'$stateProvider',
'$urlRouterProvider',
function($stateProvider, $urlRouterProvider) {
  $stateProvider
    .state('home', {
      url: '/home',
      templateUrl: 'home/_home.html',
      controller: 'HomeCtrl'
    })
    .state('about', {
      url: '/about',
      templateUrl: 'info/_about.html',
      controller: 'AboutCtrl'
    })
    .state('bands', {
      resolve: {
        bands: function($q, $timeout,$http){
            return $q(function(resolve,reject){
              $http.get('/api/bands.json').success(function(data){
                resolve(data)
              })  
            })
         }
      },
      controllerAs: 'bands',
      url: '/bands',
      templateUrl: 'bands/_bands.html',
      controller: 'BandsCtrl'
    })
    .state('releases', {
      url: '/releases',
      templateUrl: 'releases/_releases.html',
      controller: 'ReleasesCtrl',
      resolve: {
        releases: function($q, $timeout,$http){
            return $q(function(resolve,reject){
              $http.get('/api/releases.json').success(function(data){
                resolve(data)
              })  
            })
         }
      }
    });

  $urlRouterProvider.otherwise('home');
}])
