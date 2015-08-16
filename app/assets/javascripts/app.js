//Controllers

function FriendActivityCtrl(FriendActivityFeed) {
  this.test = 'Hello world!';
  this.string = FriendActivityFeed.activities;
  FriendActivityFeed.getFeed();
  this.feed = FriendActivityFeed.activities;

}
//The controller needs the array of dependencies
angular.module('activity', ['ui.router'])
.controller('FriendActivityCtrl', FriendActivityCtrl);

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
      templateUrl: 'friends_activities/_index.html',
      controller: 'FriendActivityCtrl as activity'
    });

  $urlRouterProvider.otherwise('angular');
}]);

//but the factory should NOT have the array of dependencies.  This is so confusing
//Factory
function FriendActivityFeed($http){
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
.factory('FriendActivityFeed', FriendActivityFeed);

