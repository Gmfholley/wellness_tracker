class FriendsController < ApplicationController
  def new
  end

  def create
  end
  
  def show
  end
  
  def index
  end
  
  def destroy
  end
  
  def edit
    redirect_to friends_path, notice: "Oops!  You were directed to the wrong place. If you keep getting this message, contact the web master."
  end
  
  def update
    redirect_to friends_path, notice: "Oops!  You were directed to the wrong place. If you keep getting this message, contact the web master."
  end
  
end
