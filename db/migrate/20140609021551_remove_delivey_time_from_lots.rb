class RemoveDeliveyTimeFromLots < ActiveRecord::Migration
  def change
    remove_column :lots, :delivery_time, :integer
    add_column    :lots, :min_delivery, :integer
    add_column    :lots, :max_delivery, :integer
  end
end
