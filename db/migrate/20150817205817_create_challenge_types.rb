class CreateChallengeTypes < ActiveRecord::Migration
  def change
    create_table :challenge_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
