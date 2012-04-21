class DeliveredDateToOrders < ActiveRecord::Migration
  def up
    add_column :orders, :delivered_date, :date
  end

  def down
    remove_column :orders, :delivered_date
  end
end
