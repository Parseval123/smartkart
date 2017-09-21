class RemovePriceFromOwners < ActiveRecord::Migration
  def change
    remove_column :owners, :price, :integer
  end
end
