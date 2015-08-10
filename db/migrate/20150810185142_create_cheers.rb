class CreateCheers < ActiveRecord::Migration
  def change
    create_table :cheers do |t|
      t.integer :exercise_event_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
