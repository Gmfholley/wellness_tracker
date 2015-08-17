require 'test_helper'

class ChallengeParticipantsControllerTest < ActionController::TestCase
  setup do
    @challenge_participant = challenge_participants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:challenge_participants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create challenge_participant" do
    assert_difference('ChallengeParticipant.count') do
      post :create, challenge_participant: { challenge_id: @challenge_participant.challenge_id, team_id: @challenge_participant.team_id, user_id: @challenge_participant.user_id }
    end

    assert_redirected_to challenge_participant_path(assigns(:challenge_participant))
  end

  test "should show challenge_participant" do
    get :show, id: @challenge_participant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @challenge_participant
    assert_response :success
  end

  test "should update challenge_participant" do
    patch :update, id: @challenge_participant, challenge_participant: { challenge_id: @challenge_participant.challenge_id, team_id: @challenge_participant.team_id, user_id: @challenge_participant.user_id }
    assert_redirected_to challenge_participant_path(assigns(:challenge_participant))
  end

  test "should destroy challenge_participant" do
    assert_difference('ChallengeParticipant.count', -1) do
      delete :destroy, id: @challenge_participant
    end

    assert_redirected_to challenge_participants_path
  end
end
