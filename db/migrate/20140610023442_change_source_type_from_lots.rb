class ChangeSourceTypeFromLots < ActiveRecord::Migration
  def change
    remove_column :lots, :source, :string
    add_column    :lots, :source, :text
  end
end
