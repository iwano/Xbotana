class ChangeProductColumnsValueTypes < ActiveRecord::Migration
  def up
    change_table :products do |t|
      t.change :description, :string
      t.change :category_id, :integer
    end
  end

  def down
    change_table :products do |t|
      t.change :description, :integer
      t.change :category_id, :string
    end
  end
end
