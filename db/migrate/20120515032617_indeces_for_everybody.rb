class IndecesForEverybody < ActiveRecord::Migration
  def up
  	add_index :users, :name
  	add_index :products, :name
  	add_index :states, :name
  	add_index :cities, :name
  	add_index :categories, :name
  end

  def down
  	remove_index :users, :name
  	remove_index :products, :name
  	remove_index :states, :name
  	remove_index :cities, :name
  	remove_index :categories, :name
  end
end
