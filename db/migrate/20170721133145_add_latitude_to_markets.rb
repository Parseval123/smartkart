class AddLatitudeToMarkets < ActiveRecord::Migration
  def change
    add_column :markets, :latitude, :float
  end
end
