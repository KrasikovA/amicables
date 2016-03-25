angular.module('app')
.config([
'$stateProvider',
'$urlRouterProvider',
function($stateProvider, $urlRouterProvider) {
  $stateProvider
    .state('home', {
      url: '/home',
      templateUrl: 'client/home/_home.html',
      controller: 'HomeCtrl'
    })
    .state('about', {
      url: '/about',
      controllerAs: 'about',
      templateUrl: 'client/info/_about.html',
      controller: 'AboutCtrl',
      resolve: {
        aboutBack: function($q,$http){
          return $q(function(resolve,reject){
              $http.get('/api/about/back.json').success(function(data){
                resolve(data);
              })  
            })
        },
        aboutDescription: function($q,$http){
          return $q(function(resolve,reject){
              $http.get('/api/about/description.json').success(function(data){
                resolve(data);
              })  
            })
        }
      }
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
      templateUrl: 'client/bands/_bands.html',
      controller: 'BandsCtrl'
    })
    .state('releases', {
      url: '/releases',
      templateUrl: 'client/releases/_releases.html',
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
