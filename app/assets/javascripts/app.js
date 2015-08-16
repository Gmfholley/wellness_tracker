//Controllers

function ActivityCtrl(ActivityFeed) {
  this.test = 'Hello world!';
  this.string = ActivityFeed.activities;
}
//The controller needs the array of dependencies
angular.module('activity', ['ui.router'])
.controller('ActivityCtrl', ActivityCtrl);

//Config also needs the array of dependencies
//Config
angular.module('activity', ['ui.router'])
.config([
'$stateProvider',
'$urlRouterProvider',
function($stateProvider, $urlRouterProvider) {

  $stateProvider
    .state('angular', {
      url: '/angular',
      templateUrl: '/activity.html',
      controller: 'ActivityCtrl as activity'
    });

  $urlRouterProvider.otherwise('angular');
}]);

//but the factory should NOT have the array of dependencies.  This is so confusing
//Factory
function ActivityFeed(){
  var o = {
    activities: [],
  }
  return o;
}

angular.module('activity')
.factory('ActivityFeed', ActivityFeed);

