class UpdateColumnName < ActiveRecord::Migration
  def change
    rename_column(:challenges, :corporation_id, :organization_id)
  end
end
