class TryRemovingIndexOnChallengeParticipants < ActiveRecord::Migration
  def change
    remove_index(:challenge_participants, column: [:user_id, :challenge_id])
  end
end
