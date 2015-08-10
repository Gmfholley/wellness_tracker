class ExerciseEventsController < ApplicationController
  before_action :set_exercise_event, only: [:show, :edit, :update, :destroy]

  # GET /exercise_events
  # GET /exercise_events.json
  def index
    @exercise_events = @user.exercise_events
  end

  # GET /exercise_events/1
  # GET /exercise_events/1.json
  def show
  end

  # GET /exercise_events/new
  def new
    @exercise_event = @user.exercise_event.build
  end

  # GET /exercise_events/1/edit
  def edit
  end

  # POST /exercise_events
  # POST /exercise_events.json
  def create
    @exercise_event = @user.exercise_event.create(exercise_event_params)

    respond_to do |format|
      if @exercise_event.save
        format.html { redirect_to @exercise_event, notice: 'Exercise event was successfully created.' }
        format.json { render :show, status: :created, location: @exercise_event }
      else
        format.html { render :new }
        format.json { render json: @exercise_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercise_events/1
  # PATCH/PUT /exercise_events/1.json
  def update
    respond_to do |format|
      if @exercise_event.update(exercise_event_params)
        format.html { redirect_to @exercise_event, notice: 'Exercise event was successfully updated.' }
        format.json { render :show, status: :ok, location: @exercise_event }
      else
        format.html { render :edit }
        format.json { render json: @exercise_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercise_events/1
  # DELETE /exercise_events/1.json
  def destroy
    @exercise_event.destroy
    respond_to do |format|
      format.html { redirect_to exercise_events_url, notice: 'Exercise event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise_event
      @exercise_event = ExerciseEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exercise_event_params
      params.require(:exercise_event).permit(:exercise_type_id, :exercise_unit_id, :intensity_id, :date)
    end
end
