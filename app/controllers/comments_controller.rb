class CommentsController < ApplicationController
  before_action :set_activity
  before_action :set_comment, only: [:edit, :update, :destroy]
  
  def create
    @comment = Comment.new(params_comment)
    @comment.activity_id = @activity.id
    @comment.user_id = @user.id
    respond_to do |format|
      if @comment.save
        format.html {redirect_to @activity}
        format.json {render json: @comment}
      else
        format.html {redirect_to @activity, notice: "Uh oh.  Something happened."}
        format.json {render :json => { :errors => @comment.errors.full_messages }}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @comment.update(params_comment)
        format.json {render json: @comment}
        format.html {redirect_to activity_path(@activity.id)}
      else
        format.html {redirect_to @activity, notice: "Uh oh. Something happened."}
        format.json {render :json => { :errors => @comment.errors.full_messages }}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @comment.destroy
        format.html {redirect_to @activity}
        format.json {render json: { head: :no_content}}
      else
        format.html {redirect_to @activity, notice: "Uh oh.  Something happened."}
        format.json {render json: { :errors => @comment.errors.full_messages }}
      end
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
