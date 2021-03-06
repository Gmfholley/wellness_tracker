json.array!(@activities) do |activity|
  json.extract! activity, :id, :user_id, :exercise_type_id, :duration, :intensity_id, :points, :date
  json.url activity_url(activity, format: :json)
end
