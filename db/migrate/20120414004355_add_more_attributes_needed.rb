class AddMoreAttributesNeeded < ActiveRecord::Migration
  def up
    add_column :users, :state_id, :integer
    add_column :users, :city_id, :integer
    add_column :users, :mobile_phone, :string
    add_column :users, :rfc, :string
  end

  def down
    remove_column :users, :state_id
    remove_column :users, :city_id
    remove_column :users, :mobile_phone
    remove_column :users, :rfc
  end
end
