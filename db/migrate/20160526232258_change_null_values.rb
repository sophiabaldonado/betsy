class ChangeNullValues < ActiveRecord::Migration
  def change
    change_column :orders, :confirmation_date, :string, null: true
    change_column :orders, :billing_id, :integer, null: true
    change_column :orders, :order_number, :integer, null: true
    change_column :orders, :total, :integer, null: true
  end
end
