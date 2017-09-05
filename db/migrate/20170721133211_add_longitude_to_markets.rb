class AddLongitudeToMarkets < ActiveRecord::Migration
  def change
    add_column :markets, :longitude, :float
  end
end
