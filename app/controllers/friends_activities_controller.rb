class FriendsActivitiesController < ApplicationController
  def index
    @feed = @user.friends_activities
    respond_to do |format|
      format.html
      format.json {render json: @feed}
    end
  end
end
