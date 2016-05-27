class AddCarrierToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :carrier_type, :string
  	add_column :orders, :carrier_price, :string
  end
end
