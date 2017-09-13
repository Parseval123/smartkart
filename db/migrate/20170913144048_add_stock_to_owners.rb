class AddStockToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :stock, :integer
  end
end
