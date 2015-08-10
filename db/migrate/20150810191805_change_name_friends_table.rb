class ChangeNameFriendsTable < ActiveRecord::Migration
  def change
    rename_table(:friends, :user_users)
  end
end
