class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :street1
      t.string :street2
      t.string :suburb
      t.string :city
      t.integer :postcode
      t.string :phone
      t.references :user, index: true

      t.timestamps
    end
  end
end
