class AddTokenColumnToChallenge < ActiveRecord::Migration
  def change
    add_column(:challenges, :token, :string)
    add_index(:challenges, :token, unique: true)
  end
end
