class ActivitiesController < ApplicationController
  
  helper ActivitiesHelper
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :set_activities_by_month, only: [:calendar, :graph]

  
  # GET /activities
  # GET /activities.json
  def index
    @activities = @user.activities.includes(:user, :intensity, :exercise_unit, :exercise_type).includes(:comments => [:user]).includes(:cheers => [:user]).order(:date).paginate(:page => params[:page])
  end

  # GET /activities/graph
  def graph
    respond_to do |format|
      format.html { render :graph }
      format.json { render json: @activities }
    end
  end
  
  # GET /activities/calendar
  def calendar
    respond_to do |format|
      format.html { render :calendar }
      format.json { render json: @activities }
    end
  end
  
  # GET /activities/1
  # GET /activities/1.json
  def show
    @comments = @activity.comments.includes(:user)
    @cheers = @activity.cheers.includes(:user)
  end

  # GET /activities/new
  def new
    @activity = @user.activities.build
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = @user.activities.create(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Exercise event was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to activities_path, notice: 'Exercise event was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Exercise event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end
    
    # sets the activites by pagination
    def set_activities_for_pagination
      
    end
    
    # sets the date from params which will be used to set the month
    def set_activities_by_month
      begin
        @start_date = Date.parse(params["start_date"])
      rescue
        @start_date = Date.today
        params["start_date"] = @start_date
      end
      @activities = @user.activities.where(date: @start_date.at_beginning_of_month..@start_date.at_end_of_month)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:exercise_type_id, :exercise_unit_id, :intensity_id, :date, :num_units)
    end
end
