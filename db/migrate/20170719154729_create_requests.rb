class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :shopper, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
