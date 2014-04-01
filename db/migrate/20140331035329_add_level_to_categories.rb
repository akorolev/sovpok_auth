class AddLevelToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :level, :integer
    add_index :categories, :level
    add_column :categories, :parent, :string
    add_column :categories, :has_children, :integer
  end
end
