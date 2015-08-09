class CreateExerciseEvents < ActiveRecord::Migration
  def change
    create_table :exercise_events do |t|
      t.integer :user_id
      t.integer :exercise_type_id
      t.integer :duration
      t.integer :intensity_id
      t.integer :points
      t.datetime :date

      t.timestamps null: false
    end
  end
end
