class AddingNullFalseToExpirationDateInBillings < ActiveRecord::Migration
  def change
    change_column_null :billings, :expiration_date, false
  end
end
  
