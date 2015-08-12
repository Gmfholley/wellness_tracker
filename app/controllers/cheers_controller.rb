class CheersController < ApplicationController
  before_action :set_exercise_event
  
  def create
    @cheer = Cheer.new(user_id: @user.id, exercise_event_id: @event.id)
    begin @cheer.save
      render json: @cheer
    rescue
      render json: "Errors"
    end
  end

  def destroy
    
  end
  
  
  private
  def set_exercise_event
    @event = ExerciseEvent.find(params["exercise_event_id"])
  end
end
