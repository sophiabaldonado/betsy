class AddOrderNumberColumn < ActiveRecord::Migration
  def change
    add_column :orders, :order_number, :integer, null: false
  end
end
