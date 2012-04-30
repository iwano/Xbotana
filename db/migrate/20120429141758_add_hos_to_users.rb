class AddHosToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hos, :boolean, default: false
  end
end
