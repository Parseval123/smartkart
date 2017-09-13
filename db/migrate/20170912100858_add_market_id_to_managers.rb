class AddMarketIdToManagers < ActiveRecord::Migration
  def change
    add_reference :managers, :market, index: true, foreign_key: true
  end
end
