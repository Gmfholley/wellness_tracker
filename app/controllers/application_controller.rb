class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login
  before_action :set_user
  respond_to :html, :json
  
  def show_angular
    render 'layouts/angular'
  end
  
  
  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
  
  def set_user
    @user = current_user
  end
  
end
