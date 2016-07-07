angular.module('app')
.config([
'$stateProvider',
'$urlRouterProvider',
function($stateProvider, $urlRouterProvider,$stateParams) {
  $stateProvider
    //home
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
    //about
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
    //bands
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
      url: '/bands',
      controllerAs: 'bands',
      templateUrl: 'client/bands/_bands.html',
      controller: 'BandsCtrl'
    })
    //bands list
    .state('bands.list',{
      resolve: {
        currentBand: function($q,$http,$stateParams){
            return $q(function(resolve,reject){
              $http.get('/api/bands/'+ $stateParams.bandId +'.json').success(function(data){
                resolve(data)
              })  
            })
         }
      },
      url: '/{bandId:[0-9]{1,4}}',
      views: {
        bandsList: {
          templateUrl: 'client/bands/_bands.list.html',
          controller: 'BandsList',
          controllerAs: "bandsList"
        }
      }
    })
    //releases
    .state('releases', {
      controllerAs: 'releases',
      url: '/releases',
      templateUrl: 'client/releases/_releases.html',
      controller: 'ReleasesCtrl',
      resolve: {
        releases: function($q, $http){
            return $q(function(resolve,reject){
              $http.get('/api/releases.json').success(function(data){
                resolve(data)
              })  
            })
         },
        releasesBack: function($q,$http){
          return $q(function(resolve,reject){
            $http.get('/api/releases/back.json').success(function(data){
              resolve(data);
            })
          })
        }
      }
    })
    //releases current
    .state('releases.current',{
      resolve: {
        currentBand: function($q,$http,$stateParams){
            return $q(function(resolve,reject){
              $http.get('/api/releases/'+ $stateParams.comp_name +'.json').success(function(data){
                resolve(data)
              })  
            })
         }
      },
      url: '/{comp_name:.*}',
      views: {
        releasesCurrent: {
          templateUrl: 'client/releases/_releases.current.html',
          controller: 'ReleasesCurrentCtrl',
          controllerAs: "releaseCurrent"
        }
      }
    })


  $urlRouterProvider.otherwise('home');
}])
