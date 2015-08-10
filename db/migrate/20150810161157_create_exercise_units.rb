class CreateExerciseUnits < ActiveRecord::Migration
  def change
    create_table :exercise_units do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
