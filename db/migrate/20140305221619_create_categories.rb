class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories, id: false do |t|
      t.integer :id, options: 'PRIMARY KEY'
      t.string  :name
      t.string  :slug
      t.integer :parent_id

      t.timestamps
    end
  end
end
