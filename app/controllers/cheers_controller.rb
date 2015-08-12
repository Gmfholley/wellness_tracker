class CheersController < ApplicationController
  before_action :set_exercise_event
  
  def create
    @cheer = Cheer.new(user_id: @user.id, exercise_event_id: @event.id)
    begin @cheer.save
      render json: @cheer
    rescue
      render :json => { :errors => "unique constraint failed" }
    end
  end

  def destroy
    @cheer = Cheer.find(user_id: @user.id, exercise_event_id: @event.id)
    if @cheer.destroy
      render json: { head: :no_content}
    else
      render :json => { :errors => @cheer.errors.full_messages }
    end
  end
  
  
  private
  def set_exercise_event
    @event = ExerciseEvent.find(params["exercise_event_id"])
  end
end
