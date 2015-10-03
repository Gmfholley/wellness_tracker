class CheersController < ApplicationController
  before_action :set_activity
  
  def create
    @cheer = Cheer.new(user_id: @user.id, activity_id: @event.id)
    
    respond_to do |format|
      begin @cheer.save
        format.json {render json: @cheer}
        format.html {redirect_to friends_feed_path}
      rescue
        format.json {render :json => { :errors => "unique constraint failed" }}
        format.html {redirect_to @activity, notice: "Uh oh.  Something went wrong."}
      end
    end
  end

  def destroy
    @cheer = Cheer.find_by(user_id: @user.id, activity_id: @event.id)
    respond_to do |format|
      if @cheer.destroy
        format.json {render json: { head: :no_content}}
        format.html {redirect_to friends_feed_path}
      else
        format.json  {render :json => { :errors => @cheer.errors.full_messages }}
        format.html {redirect_to @activity, notice: "Uh oh. Something went wrong."}
      end
    end
  end
  
  
  private
  def set_activity
    @event = Activity.find(params["activity_id"])
  end
end
