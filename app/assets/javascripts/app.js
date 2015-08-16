angular.module('activity', [])
.config([
'$stateProvider',
'$urlRouterProvider',
function($stateProvider, $urlRouterProvider) {

  $stateProvider
    .state('angular', {
      url: '/angular',
      templateUrl: 'activities/_activity.html',
      controller: 'ActivityCtrl'
    });

  $urlRouterProvider.otherwise('angular');
}]);




angular.module('activity')
.controller('ActivityCtrl',  function(){
  alert("Worked!");
  this.test = "hello world!";
});