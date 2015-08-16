//Controllers



function FriendActivityCtrl(FriendActivityFeed) {
  this.test = 'Hello world!';
  this.string = FriendActivityFeed.activities;
  FriendActivityFeed.getFeed();
  this.feed = FriendActivityFeed.activities;

}

function ExerciseEventCtrl(){
  this.test = "Hello world!";
}


//The controller needs the array of dependencies
angular.module('activity', ['ui.router'])
.controller('FriendActivityCtrl', FriendActivityCtrl);
angular.module('activity', ['ui.router'])
.controller('ExerciseEventCtrl', ExerciseEventCtrl);





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
    })
    
    .state('exercise_event', {
      url: '/exercise_events/{id}',
      templateUrl: 'exercise_events/_show.html',
      controller: 'ExerciseEventCtrl as exercise_event'
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

