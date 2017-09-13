class RemoveManagerIdIdFromMarkets < ActiveRecord::Migration
  def change
    remove_column :markets, :manager_id, :integer
  end
end
