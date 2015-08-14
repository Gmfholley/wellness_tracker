angular.module('activity', ['ui.router'])
.config([
'$stateProvider',
'$urlRouterProvider',
function($stateProvider, $urlRouterProvider) {

  $stateProvider
    .state('home', {
      url: '/home',
      templateUrl: 'activities/_activity.html',
      controller: 'ActivityCtrl'
    });

  $urlRouterProvider.otherwise('home');
}])