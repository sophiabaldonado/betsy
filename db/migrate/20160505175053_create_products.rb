class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :price, null: false
      t.string :description
      t.integer :user_id, null: false
      t.integer :inventory, null: false
      t.string :photo_url
      t.boolean :retired, null: false
      t.boolean :deleted, null: false
      t.timestamps null: false
    end
  end
end
