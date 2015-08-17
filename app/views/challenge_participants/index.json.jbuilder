json.array!(@challenge_participants) do |challenge_participant|
  json.extract! challenge_participant, :id, :challenge_id, :user_id, :team_id
  json.url challenge_participant_url(challenge_participant, format: :json)
end
