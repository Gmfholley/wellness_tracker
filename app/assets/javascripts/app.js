//Controllers

function ActivityCtrl(ActivityFeed) {
  this.test = 'Hello world!';
  this.string = ActivityFeed.activities;
  ActivityFeed.getFeed();
  this.feed = ActivityFeed.activities;

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
      templateUrl: 'activities/_activity.html',
      controller: 'ActivityCtrl as activity'
    });

  $urlRouterProvider.otherwise('angular');
}]);

//but the factory should NOT have the array of dependencies.  This is so confusing
//Factory
function ActivityFeed($http){
  var feed = {
    activities: [],
  }
  
  function addActivities(data) {
    angular.copy(data, feed.activities);
  }
  
  feed.getFeed = function() {
    return $http.get('/friends_feed.json').success(addActivities);
  }
  
  
  return feed;
}

angular.module('activity')
.factory('ActivityFeed', ActivityFeed);

