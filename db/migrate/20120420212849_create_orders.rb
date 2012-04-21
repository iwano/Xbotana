class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.date :order_date
      t.integer :number_products
      t.decimal :total
      t.boolean :delivered, default: false

      t.timestamps
    end
  end
end
