class ChangeTableNameAgainThisTimeRight < ActiveRecord::Migration
  def change
    rename_table(:user_users, :users_users)
  end
end
