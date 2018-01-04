class AddManagerIdToMarkets < ActiveRecord::Migration
  def change
    add_reference :markets, :manager, index: true, foreign_key: true, null: true
  end
end
