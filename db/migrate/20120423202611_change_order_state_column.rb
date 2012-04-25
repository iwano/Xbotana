class ChangeOrderStateColumn < ActiveRecord::Migration
  def up
    remove_column :orders, :delivered
    add_column :orders, :status, :string, :default => 'processing'
  end

  def down
    add_column :orders, :delivered, :boolean
    remove_column :orders, :status
  end
end
