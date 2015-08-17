json.array!(@challenges) do |challenge|
  json.extract! challenge, :id, :name, :challenge_type_id, :num_type, :num_in_type, :start_date, :end_date, :corporation_id, :description
  json.url challenge_url(challenge, format: :json)
end
