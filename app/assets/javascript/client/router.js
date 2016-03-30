angular.module('app')
.config([
'$stateProvider',
'$urlRouterProvider',
function($stateProvider, $urlRouterProvider) {
  $stateProvider
    .state('home', {
      url: '/home',
      templateUrl: 'client/home/_home.html',
      controllerAs: 'home',
      controller: 'HomeCtrl',
      resolve:{
        homeBack: function($q,$http){
          return $q(function(resolve,reject){
            $http.get('/api/home/back.json').success(function(data){
              resolve(data);
            })
          })
        }
      }
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
        bands: function($q,$http){
            return $q(function(resolve,reject){
              $http.get('/api/bands.json').success(function(data){
                resolve(data)
              })  
            })
         },
        bandsBack: function($q, $http){
          return $q(function(resolve,reject){
            $http.get('/api/bands/back.json').success(function(data){
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
      controllerAs: 'releases',
      url: '/releases',
      templateUrl: 'client/releases/_releases.html',
      controller: 'ReleasesCtrl',
      resolve: {
        /*releases: function($q, $http){
            return $q(function(resolve,reject){
              $http.get('/api/releases.json').success(function(data){
                resolve(data)
              })  
            })
         },*/
        releasesBack: function($q,$http){
          return $q(function(resolve,reject){
            $http.get('/api/releases/back.json').success(function(data){
              resolve(data);
            })
          })
        }
      }
    });

  $urlRouterProvider.otherwise('home');
}])