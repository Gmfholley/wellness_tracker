class ChangeExerciseEvent < ActiveRecord::Migration
  def change
    remove_column(:exercise_events, :duration)
    remove_column(:exercise_events, :points)
    add_column(:exercise_events, :num_units, :float)
    add_column(:exercise_events, :exercise_unit_id, :integer)
  end
end
