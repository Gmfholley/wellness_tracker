angular.module('activity', ['ui.router', 'templates'])
.config([
'$stateProvider',
'$urlRouterProvider',
function($stateProvider, $urlRouterProvider) {

  $stateProvider
    .state('angular', {
      url: '/angular',
      templateUrl: 'activity.html',
      controller: 'ActivityCtrl'
    });

  $urlRouterProvider.otherwise('angular');
}]);

function ActivityCtrl(ActivityFeed) {
  this.test = 'Hello world!';
  this.string = ActivityFeed.posts;
}


angular.module('activity', [])
.controller('ActivityCtrl', ActivityCtrl);


function ActivityFeed(){
  var o = {
    posts: [],
  }
  return o;
}

angular.module('activity')
.factory('ActivityFeed', ActivityFeed);