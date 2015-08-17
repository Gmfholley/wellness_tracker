class MakeOrganizationBelongToUser < ActiveRecord::Migration
  def change
    remove_column(:organizations, :first_name)
    remove_column(:organizations, :last_name)
    remove_column(:organizations, :email)
    add_column(:organizations, :user_id, :integer)
  end
end
