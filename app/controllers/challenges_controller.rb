class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]
  before_action :set_organization, only: [:new, :create, :index]
  before_action :owns_challenge, only: [:edit, :update, :new, :create, :destroy]
  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = @user.challenges
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
  end

  # GET /challenges/1/edit
  def edit
  end

  # POST /challenges
  # POST /challenges.json
  def create
    @challenge = @organization.challenges.build(challenge_params)

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to @challenge, notice: 'Challenge was successfully created.' }
        format.json { render :show, status: :created, location: @challenge }
      else
        format.html { render :new }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenges/1
  # PATCH/PUT /challenges/1.json
  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
        format.json { render :show, status: :ok, location: @challenge }
      else
        format.html { render :edit }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challenge.destroy
    respond_to do |format|
      format.html { redirect_to challenges_url, notice: 'Challenge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # redirects to home page if an unauthorized user attempts to access the route
    def owns_challenge
      unless @organization.user = @user
        redirects_to :home, notice: "Only the user with admin privileges for #{organization.name} can change/create challenges."
      end
    end
    # sets the @organization (if there is no challenge)
    def set_organization
      @organization = Organization.find(params[:organization_id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
      @organization = @challenge.organization
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_params
      params.require(:challenge).permit(:name, :challenge_type_id, :num_type, :num_in_type, :start_date, :end_date, :organization_id, :description, :rule_eaches_attributes => [:challenge_id, :num_exercise_units, :exercise_unit_id], :rule_totals_attributes => [:num_exercise_units, :exercise_unit_id, :num_time_periods, :time_period_id], :rule_qualifies_attributes => [:time_period_id, :num_exercise_units, :exercise_unit_id])
    end
end
