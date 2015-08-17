class CreateRuleTotals < ActiveRecord::Migration
  def change
    create_table :rule_totals do |t|
      t.integer :challenge_id
      t.integer :exercise_unit_id
      t.integer :num_exercise_units
      t.integer :time_period_id
      t.integer :num_time_periods

      t.timestamps null: false
    end
  end
end
