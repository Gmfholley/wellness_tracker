class AddIndexBackAgainToChallengeParticipant < ActiveRecord::Migration
  def change
    add_index(:challenge_participants, [:user_id, :challenge_id], unique: true)
  end
end
