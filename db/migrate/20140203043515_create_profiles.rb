class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true
      t.string :location
      t.text :about
      t.date :birthday
      t.string :phone
    end
  end
end
