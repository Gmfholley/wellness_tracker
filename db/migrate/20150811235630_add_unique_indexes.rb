class AddUniqueIndexes < ActiveRecord::Migration
  def change
    add_index(:cheers, [:user_id, :exercise_event_id], unique: true)
    add_index(:users_users, [:user_id, :friend_id], unique: true)
  end
end
