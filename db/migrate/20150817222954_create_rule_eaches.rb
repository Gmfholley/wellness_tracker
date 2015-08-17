class CreateRuleEaches < ActiveRecord::Migration
  def change
    create_table :rule_eaches do |t|
      t.integer :challenge_id
      t.integer :exercise_unit_id
      t.integer :num_exercise_units

      t.timestamps null: false
    end
  end
end
