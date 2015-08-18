class SwapTableNames < ActiveRecord::Migration
  def change
    rename_table(:rule_eaches, :rule_others)
    rename_table(:rule_qualifies, :rule_eaches)
    rename_table(:rule_others, :rule_qualifies)
  end
end
