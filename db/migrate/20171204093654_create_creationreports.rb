class CreateCreationreports < ActiveRecord::Migration
  def change
    create_table :creationreports do |t|
      t.references :market
      t.references :manager
      t.timestamps null: false
    end
  end
end
