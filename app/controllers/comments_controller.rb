class CommentsController < ApplicationController
  before_action :set_activity
  before_action :set_comment, only: [:edit, :update, :destroy]
  
  
  def create
    @comment = Comment.new(params_comment)
    @comment.activity_id = @activity.id
    @comment.user_id = @user.id
    if @comment.save
      render json: @comment
    else
      render :json => { :errors => @comment.errors.full_messages }
    end
  end

  def edit
  end

  def update
    if @comment.update(params_comment)
      # render json: @comment
      redirect_to activity_path(@activity.id)
    else
      
      # render :json => { :errors => @comment.errors.full_messages }
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
  def set_activity
    @activity = Activity.find(params["activity_id"])
  end
  
  def set_comment
    @comment = Comment.find(params["id"])
  end
  
  def params_comment
    params.require(:comment).permit(:content)
  end
end
