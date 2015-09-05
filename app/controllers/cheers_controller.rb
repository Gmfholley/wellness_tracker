class CheersController < ApplicationController
  before_action :set_activity
  
  def create
    @cheer = Cheer.new(user_id: @user.id, activity_id: @event.id)
    begin @cheer.save
      render json: @cheer
    rescue
      render :json => { :errors => "unique constraint failed" }
    end
  end

  def destroy
    @cheer = Cheer.find_by(user_id: @user.id, activity_id: @event.id)
    if @cheer.destroy
      render json: { head: :no_content}
    else
      render :json => { :errors => @cheer.errors.full_messages }
    end
  end
  
  
  private
  def set_activity
    @event = ExerciseEvent.find(params["activity_id"])
  end
end
