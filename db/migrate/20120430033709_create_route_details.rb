class CreateRouteDetails < ActiveRecord::Migration
  def change
    create_table :route_details do |t|
      t.integer :route_id
      t.integer :user_id
      t.timestamps
    end
  end
end
