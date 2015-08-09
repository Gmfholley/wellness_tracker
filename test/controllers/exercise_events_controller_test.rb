require 'test_helper'

class ExerciseEventsControllerTest < ActionController::TestCase
  setup do
    @exercise_event = exercise_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exercise_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exercise_event" do
    assert_difference('ExerciseEvent.count') do
      post :create, exercise_event: { date: @exercise_event.date, duration: @exercise_event.duration, exercise_type_id: @exercise_event.exercise_type_id, intensity_id: @exercise_event.intensity_id, points: @exercise_event.points, user_id: @exercise_event.user_id }
    end

    assert_redirected_to exercise_event_path(assigns(:exercise_event))
  end

  test "should show exercise_event" do
    get :show, id: @exercise_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exercise_event
    assert_response :success
  end

  test "should update exercise_event" do
    patch :update, id: @exercise_event, exercise_event: { date: @exercise_event.date, duration: @exercise_event.duration, exercise_type_id: @exercise_event.exercise_type_id, intensity_id: @exercise_event.intensity_id, points: @exercise_event.points, user_id: @exercise_event.user_id }
    assert_redirected_to exercise_event_path(assigns(:exercise_event))
  end

  test "should destroy exercise_event" do
    assert_difference('ExerciseEvent.count', -1) do
      delete :destroy, id: @exercise_event
    end

    assert_redirected_to exercise_events_path
  end
end
