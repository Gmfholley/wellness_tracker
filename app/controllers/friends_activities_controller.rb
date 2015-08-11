class FriendsActivitiesController < ApplicationController
  def index
    @feed = @user.friends_activities
  end
end
