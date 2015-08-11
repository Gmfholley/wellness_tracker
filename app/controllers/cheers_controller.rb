class CheersController < ApplicationController
  before_action :set_exercise_event
  
  def create
    @cheer = Cheer.create(user_id: @user.id, exercise_event_id: @exercise_event.id)
    if @cheer.errors.empty?
      render json: @cheer
    else
      render json: @cheer.errors
    end
  end

  def destroy
    
  end
  
  
  private
  def set_exercise_event
    @event = ExerciseEvent.find(params["exercise_event_id"])
  end
end
