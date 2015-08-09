json.array!(@exercise_events) do |exercise_event|
  json.extract! exercise_event, :id, :user_id, :exercise_type_id, :duration, :intensity_id, :points, :date
  json.url exercise_event_url(exercise_event, format: :json)
end
