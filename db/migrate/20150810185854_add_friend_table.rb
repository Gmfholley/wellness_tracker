class AddFriendTable < ActiveRecord::Migration
  def change
    create_table :friends, :id => false do |t|
      t.integer :user_id, as: :user_id
      t.integer :user_id, as: :friend_id

      t.timestamps null: false
    end
  end
end
