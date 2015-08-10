class DropFriendsTableAndStartAgain < ActiveRecord::Migration
  def change
    drop_table :users_users
    
    create_table :users_users, :id => false do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps null: false
    end
  end
end
