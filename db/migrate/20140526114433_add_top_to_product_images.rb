class AddTopToProductImages < ActiveRecord::Migration
  def change
    add_column :product_images, :top, :boolean
    add_index :product_images, [:product_id, :top]
  end
end
