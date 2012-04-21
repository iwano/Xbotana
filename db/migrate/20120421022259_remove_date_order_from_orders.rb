class RemoveDateOrderFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :order_date
  end

  def down
    add_column :orders, :order_date, :date
  end
end
