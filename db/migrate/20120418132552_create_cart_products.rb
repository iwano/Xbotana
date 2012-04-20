class CreateCartProducts < ActiveRecord::Migration
  def change
    create_table :cart_products do |t|
      t.integer :product_id
      t.integer :user_id
      t.integer :quantity
      t.decimal :subtotal

      t.timestamps
    end
  end
end
