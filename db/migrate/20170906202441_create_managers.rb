class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :name
      t.string :surname
      t.integer :yearofbirth
      t.string :tel
      t.string :email
      t.text :curriculum
      t.string :password

      t.timestamps null: false
    end
  end
end
