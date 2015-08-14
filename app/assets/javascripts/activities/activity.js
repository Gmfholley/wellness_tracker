function ActivityService() {
  var feed = {
    activities: [];
  }
  
  
  feed.getAll = function(){
    
  }
  
  
  
  return feed;
}



angular.module('activity')
.factory('ActivityService', ActivityService);