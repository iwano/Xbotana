class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.integer :number
      t.date :expiry_date

      t.timestamps
    end
  end
end
