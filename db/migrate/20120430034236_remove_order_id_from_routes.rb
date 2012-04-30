class RemoveOrderIdFromRoutes < ActiveRecord::Migration
  def up
    remove_column :routes, :order_id
  end

  def down
    add_column :routes, :order_id, :integer
  end
end
