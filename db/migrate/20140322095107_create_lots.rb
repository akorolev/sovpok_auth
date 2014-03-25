class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.string :title
      t.text :description
      t.datetime :end_date
      t.integer :prepay
      t.integer :fee
      t.decimal :min_order, precision: 8, scale: 2
      t.boolean :pickup_allowed
      t.text :pickup_description
      t.decimal :postage_val1, precision: 8, scale: 2
      t.string :postage_info1
      t.decimal :postage_val2, precision: 8, scale: 2
      t.string :postage_info2
      t.decimal :postage_val3, precision: 8, scale: 2
      t.string :postage_info3
      t.string :source
      t.integer :serial
      t.string :keywords
      t.integer :status
      t.references :category, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
