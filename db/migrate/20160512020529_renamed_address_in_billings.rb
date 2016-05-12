class RenamedAddressInBillings < ActiveRecord::Migration
  def change
    change_table :billings do |t|
      t.rename :address1, :address
    end
  end
end
