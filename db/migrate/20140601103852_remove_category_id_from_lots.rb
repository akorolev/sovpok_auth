class RemoveCategoryIdFromLots < ActiveRecord::Migration
  def change
    remove_column :lots, :category_id, :reference
    remove_column :lots, :end_date, :datetime
    remove_column :lots, :pickup_allowed, :boolean
    remove_column :lots, :pickup_description, :text
    remove_column :lots, :postage_val1, :decimal
    remove_column :lots, :postage_val2, :decimal
    remove_column :lots, :postage_val3, :decimal
    remove_column :lots, :postage_info1, :string
    remove_column :lots, :postage_info2, :string
    remove_column :lots, :postage_info3, :string
    remove_column :lots, :keywords, :string
    add_column    :lots, :duration, :integer
    add_column    :lots, :delivery_time, :integer
    add_column    :lots, :start_time, :datetime
  end
end
