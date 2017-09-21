class AddPriceToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :price, :float
  end
end
