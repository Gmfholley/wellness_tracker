class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]  
  before_action :current_user
  before_action :prevent_duplicate_sessions, only [:new, :create]
   
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, :notice => "Welcome to Wellness Tracker!"
    else
      render :new, :notice => "Unable to create a new user."
    end
  end
  
  def index
    @users = @user.friends
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to @user, :notice => "Account updated!"
    else
      render :edit, :notice => "Unable to update your account."
    end
  end
  
  def show
  end
  
  def destroy
    if @user.destroy
      redirect_to login_path, :notice => "Your account was deleted."
    else
      redirect_to @user, notice: => "Sorry.  Something went wrong.  We are unable to deleter your account."
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
  
  def prevent_duplicate_sessions
    if @user
      redirect_to @user, :notice => "You are already logged in.  To create a new account, log out first."
    end
  end
  
end
