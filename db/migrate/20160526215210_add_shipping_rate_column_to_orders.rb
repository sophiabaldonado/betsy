class AddShippingRateColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :shipping_rate, :string
  end
end
