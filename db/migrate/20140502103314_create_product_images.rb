class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.string :caption
      t.references :product, index: true

      t.timestamps
    end
  end
end
