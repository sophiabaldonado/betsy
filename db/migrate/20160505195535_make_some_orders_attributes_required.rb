class MakeSomeOrdersAttributesRequired < ActiveRecord::Migration
  def change
    change_column_null :orders, :status, false
    change_column_null :orders, :confirmation_date, false
    change_column_null :orders, :billing_id, false
  end
end
