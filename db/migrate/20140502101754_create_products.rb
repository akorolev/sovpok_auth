class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.boolean :pickup_allowed
      t.text :pickup_description
      t.decimal :postage_val1, precision: 8, scale: 2
      t.string :postage_info1
      t.decimal :postage_val2, precision: 8, scale: 2
      t.string :postage_info2
      t.decimal :postage_val3, precision: 8, scale: 2
      t.string :postage_info3
      t.references :user, index: true
      t.references :category, index: true
      t.references :lot, index: true

      t.timestamps
    end
  end
end
