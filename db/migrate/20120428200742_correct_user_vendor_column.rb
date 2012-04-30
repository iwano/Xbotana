class CorrectUserVendorColumn < ActiveRecord::Migration
  def up
    change_column_default(:users, :vendor, false)
  end

  def down
    change_column_default(:users, :vendor, nil)
  end
end
