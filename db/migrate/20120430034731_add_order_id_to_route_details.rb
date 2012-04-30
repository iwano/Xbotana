class AddOrderIdToRouteDetails < ActiveRecord::Migration
  def change
    add_column :route_details, :order_id, :integer
    remove_column :route_details, :user_id
  end
end
