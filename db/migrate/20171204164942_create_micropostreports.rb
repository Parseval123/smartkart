class CreateMicropostreports < ActiveRecord::Migration
  def change
    create_table :micropostreports do |t|
    t.references :user
    t.references :micropost
      t.timestamps null: false
    end
  end
end
