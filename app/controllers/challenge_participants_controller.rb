class ChallengeParticipantsController < ApplicationController
  # way for participants to sign up for a challenge
  # way to get a list of participants
  
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_challenge
  before_action :set_challenge_participant, only: [:destroy]

  # GET /challenge_participants
  # GET /challenge_participants.json
  def index
    @challenge_participants = @challenge.challenge_participants.includes(:team, :user)
  end

  # GET /challenge_participants/new
  def new
    @challenge_participant = @challenge.challenge_participants.build
    if @user.blank?
      @user = User.new
    end
  end

  # POST /challenge_participants
  # POST /challenge_participants.json
  def create
    logged_in_log_in_or_create_user
    @challenge_participant = @challenge.challenge_participants.build(user_id: @user.id)
    respond_to do |format|
      begin
        if @challenge_participant.save
          format.html { redirect_to :root, notice: "You successfully joined #{@challenge.name}." }
          format.json { render :show, status: :created, location: @challenge_participant }
        else
          format.html { render :new }
          format.json { render json: @challenge_participant.errors, status: :unprocessable_entity }
        end
      rescue
        @challenge_participant = ChallengeParticipant.where(user_id: @user.id, challenge_id: @challenge.id).first
        format.html { redirect_to :root, notice: "You have already joined this challenge." }
        format.json { render :show, status: :created, location: @challenge_participant }
      end
    end
  end

  # DELETE /challenge_participants/1
  # DELETE /challenge_participants/1.json
  def destroy
    @challenge_participant.destroy
    respond_to do |format|
      format.html { redirect_to action: "index", id: @challenge.token, notice: 'Challenge participant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find_by(token: params[:token_id])
      if @challenge.id.blank?
        redirect_to challenge_not_found_path, notice: "Sorry.  That challenge was not found or is no longer available for sign up. Please check the url and try again." 
      end
    end
    
    #sets the participant from params
    def set_challenge_participant
      @user = User.find_by(username: params["user_id"])
      @challenge_participant = ChallengeParticipant.find_by(user_id: @user.id, challenge: @challenge.id)
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_participant_params
      params.require(:challenge_participant).permit(:challenge_id, :user_id, :team_id)
    end
    
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :profile_picture, :username)
    end
    
    def trying_to_login?
      !params[:email].blank?
    end
    
    def logged_in_log_in_or_create_user
      if @user.blank?
        if trying_to_login?
          if !@user = login(params[:email], params[:password])
            @user = User.new
            @user.errors.add("Email or password combination", "was not correct")
          end
        else    
          if @user = User.create(user_params)
            @user = login(params[:user][:email], params[:user][:password])
          end
        end
      end
    end
    
end
