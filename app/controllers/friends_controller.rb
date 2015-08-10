class FriendsController < ApplicationController
  before_action :set_friend, :only => [:show, :destroy]
  
  def new
    @users = @user.not_friends
  end

  def create
    @friend = User.find(params["user_id"])
    if @user.friends.push(@friend)
      redirect_to friends_path, notice: "You have added #{@friend.first_name} as your friend."
    else
      redirect_to friends_path, notice: "Something happened.  The friend did not get added."
    end
  end
  
  def show
  end
  
  def index
    @friends = @user.friends
  end
  
  def destroy
    if @user.friends.delete(@friend)
      redirect_to friends_path, notice: "You are no longer friends with #{@friend.first_name}."
    else
      redirect_to friends_path, notice: "Something happened.  You did not delete #{@friend.first_name} from your contacts."
    end
  end
  
  def edit
    redirect_to friends_path, notice: "Oops!  You were directed to the wrong place. If you keep getting this message, contact the web master."
  end
  
  def update
    redirect_to friends_path, notice: "Oops!  You were directed to the wrong place. If you keep getting this message, contact the web master."
  end
  
  
  private
  def set_friend
    @friend = User.find(params["id"])
  end
end
