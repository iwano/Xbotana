class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.integer :order_id
      t.integer :user_id

      t.timestamps
    end
  end
end
