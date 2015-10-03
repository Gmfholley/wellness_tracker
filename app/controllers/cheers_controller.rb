class CheersController < ApplicationController
  before_action :set_activity
  
  def create
    @cheer = Cheer.new(user_id: @user.id, activity_id: @event.id)
    
    respond_to do |format|
      begin @cheer.save
        format.json {json: @cheer}
        format.html {redirect_to activities_path}
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
        render json: { head: :no_content}
      else
        render :json => { :errors => @cheer.errors.full_messages }
      end
    end
  end
  
  
  private
  def set_activity
    @event = Activity.find(params["activity_id"])
  end
end
