class AddingExpirationDateToCcInBillings < ActiveRecord::Migration
  def change
    add_column :billings, :expiration_date, :string
  end
end
