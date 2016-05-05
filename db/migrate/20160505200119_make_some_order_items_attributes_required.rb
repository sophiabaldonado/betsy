class MakeSomeOrderItemsAttributesRequired < ActiveRecord::Migration
  def change
    change_column_null :order_items, :quantity, false
    change_column_null :order_items, :name, false
    change_column_null :order_items, :price, false
    change_column_null :order_items, :status, false
    change_column_null :order_items, :order_id, false
    change_column_null :order_items, :product_id, false
  end
end
