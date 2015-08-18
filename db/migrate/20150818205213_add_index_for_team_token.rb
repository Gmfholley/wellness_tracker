class AddIndexForTeamToken < ActiveRecord::Migration
  def change
    add_index(:teams, :token, :unique => true)
  end
end
