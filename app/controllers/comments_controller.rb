class CommentsController < ApplicationController
  before_action :set_exercise_event
  before_action :set_comment, only: [:edit, :update, :destroy]
  
  
  def create
    @comment = Comment.new(params_comment)
    @comment.exercise_event_id = @exercise_event.id
    @comment.user_id = @user.id
    if @comment.save
      render json: @comment
    else
      render :json => { :errors => @comment.errors.full_messages }
    end
  end

  def edit
    #TODO - I don't think I need this.
  end

  def update
    if @comment.update(params_comment)
      render json: @comment
    else
      render :json => { :errors => @comment.errors.full_messages }
    end
  end

  def destroy
    if @comment.destroy
      render json: { head: :no_content}
    else
      render json: { :errors => @comment.errors.full_messages }
    end
  end
  
  private
  def set_exercise_event
    @exercise_event = ExerciseEvent.find(params["exercise_event_id"])
  end
  
  def set_comment
    @comment = Comment.find(params["id"])
  end
  
  def params_comment
    params.require(:comment).permit(:content)
  end
end
