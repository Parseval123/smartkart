class AddStatusToMarkets < ActiveRecord::Migration
  def change
    add_column :markets, :status, :boolean
  end
end
