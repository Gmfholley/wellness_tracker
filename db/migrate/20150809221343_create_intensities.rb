class CreateIntensities < ActiveRecord::Migration
  def change
    create_table :intensities do |t|
      t.string :name
      t.integer :point_adjustment

      t.timestamps null: false
    end
  end
end
