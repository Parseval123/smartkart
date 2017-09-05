class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :address
      t.string :group
      t.text :info

      t.timestamps null: false
    end
  end
end
