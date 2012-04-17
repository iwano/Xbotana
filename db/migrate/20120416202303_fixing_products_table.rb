class FixingProductsTable < ActiveRecord::Migration
  def up
    remove_column :products, :lot
    add_column :products, :presentation_id, :integer
    add_column :products, :lot_id, :integer
  end

  def down
    add_column :products, :lot
    remove_column :products, :presentation_id
    remove_column :products, :lot_id
  end
end
