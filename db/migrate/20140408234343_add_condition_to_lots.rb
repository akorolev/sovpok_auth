class AddConditionToLots < ActiveRecord::Migration
  def change
    add_column :lots, :condition, :text
  end
end
