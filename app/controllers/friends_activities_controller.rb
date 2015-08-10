class FriendsActivitiesController < ApplicationController
  before_action :set_friend
  
  
  def index
  end

  def show
  end
  
  private
  def set_friend
    @friend = User.find(params["id"])
  end
end
