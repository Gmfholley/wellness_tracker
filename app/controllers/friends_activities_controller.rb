class FriendsActivitiesController < ApplicationController
  def index
    @feed = @user.friends_activities.paginate(:page => params[:page])
  end
end
