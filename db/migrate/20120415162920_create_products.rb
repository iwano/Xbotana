class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :description
      t.decimal :price
      t.integer :lot
      t.string :category_id

      t.timestamps
    end
  end
end
