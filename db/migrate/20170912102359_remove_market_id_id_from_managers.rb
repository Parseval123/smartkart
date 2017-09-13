class RemoveMarketIdIdFromManagers < ActiveRecord::Migration
  def change
    remove_column :managers, :market_id_id, :integer
  end
end
