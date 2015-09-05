class ChangeNameOfModelExerciseEventToActivity < ActiveRecord::Migration
  def change
    rename_table(:exercise_events, :activities)
  end
end
