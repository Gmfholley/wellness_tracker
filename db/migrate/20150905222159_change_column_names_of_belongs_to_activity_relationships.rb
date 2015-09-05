class ChangeColumnNamesOfBelongsToActivityRelationships < ActiveRecord::Migration
  def change
    rename_column(:comments, :exercise_event_id, :activity_id)
    rename_column(:cheers, :exercise_event_id, :activity_id)
  end
end
