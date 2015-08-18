class ChallengeParticipantsController < ApplicationController
  skip_before_action :require_login, only: [:new]
  before_action :set_challenge

  # GET /challenge_participants
  # GET /challenge_participants.json
  def index
    @participants = @challenge.users.order(:team)
  end

  # GET /challenge_participants/new
  def new
    @challenge_participant = @challenge.challenge_participants.build
  end

  # POST /challenge_participants
  # POST /challenge_participants.json
  def create
    @challenge_participant = @challenge.challenge_participants.build(user_id: @user.id)

    respond_to do |format|
      if @challenge_participant.save
        format.html { redirect_to @challenge_participant, notice: 'Challenge participant was successfully created.' }
        format.json { render :show, status: :created, location: @challenge_participant }
      else
        format.html { render :new }
        format.json { render json: @challenge_participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenge_participants/1
  # DELETE /challenge_participants/1.json
  def destroy
    @challenge_participant.destroy
    respond_to do |format|
      format.html { redirect_to challenge_participants_url, notice: 'Challenge participant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find_by(token: params[:token_id])
      redirect_to challenge_not_found_path, notice: "Sorry.  That challenge was not found or is no longer available for sign up. Please check the url and try again." if @challenge.id.blank?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_participant_params
      params.require(:challenge_participant).permit(:challenge_id, :user_id, :team_id)
    end
end
