class ChangeColumnNameToFriendId < ActiveRecord::Migration
  def change
    rename_column(:users_users, :user_id, :friend_id)
  end
end
