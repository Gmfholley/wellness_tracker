class FriendsController < ApplicationController
  before_action :set_friend, :only => [:show, :destroy]
  
  def new
    @users = @user.not_friends
    @message = "Here are some people you might know."
    render "index"
  end

  def create
    @friend = User.find_by(username: params["user_id"])
    if @user.friends.push(@friend)
      redirect_to friends_path, notice: "You have added #{@friend.first_name} as your friend."
    else
      redirect_to friends_path, notice: "Something happened.  The friend did not get added."
    end
  end
  
  def show
  end
  
  def index
    @users = @user.friends.paginate(:page => params[:page])
    @message = "These are your friends."
  end
  
  def destroy
    if @user.friends.delete(@friend)
      redirect_to friends_path, notice: "You are no longer friends with #{@friend.first_name}."
    else
      redirect_to friends_path, notice: "Something happened.  You did not delete #{@friend.first_name} from your contacts."
    end
  end
  
  private
  def set_friend
    @friend = User.find_by(username: params["id"])
  end
end
