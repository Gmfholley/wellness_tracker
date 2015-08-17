class CreateChallengeParticipants < ActiveRecord::Migration
  def change
    create_table :challenge_participants do |t|
      t.integer :challenge_id
      t.integer :user_id
      t.integer :team_id

      t.timestamps null: false
    end
  end
end
