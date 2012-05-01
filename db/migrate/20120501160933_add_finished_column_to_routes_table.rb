class AddFinishedColumnToRoutesTable < ActiveRecord::Migration
  def change
    add_column :routes, :finished, :boolean, default: true
  end
end
