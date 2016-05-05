class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :quantity, null: false
      t.integer :product_id, null: false

      t.timestamps null: false
    end
  end
end
