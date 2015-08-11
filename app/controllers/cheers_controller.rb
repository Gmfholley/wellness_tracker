class CheersController < ApplicationController
  before_action :set_user
  before_action :set_friend
  
  def create
    
  end

  def destroy
  end
  
  
  private
  def set_friend
    @friend = User.find(params["username"])
  end
end
