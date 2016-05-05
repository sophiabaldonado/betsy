class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.string :name
      t.decimal :price
      t.string :status
      t.integer :order_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
