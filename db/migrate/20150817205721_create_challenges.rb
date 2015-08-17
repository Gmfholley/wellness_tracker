class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.integer :challenge_type_id
      t.integer :num_type
      t.integer :num_in_type
      t.datetime :start_date
      t.datetime :end_date
      t.integer :corporation_id
      t.string :description

      t.timestamps null: false
    end
  end
end
