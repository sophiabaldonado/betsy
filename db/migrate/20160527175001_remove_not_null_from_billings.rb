class RemoveNotNullFromBillings < ActiveRecord::Migration
  def change
      change_column :billings, :first_name, :string, null: true
      change_column :billings, :last_name, :string, null: true
      change_column :billings, :email, :string, null: true
      change_column :billings, :cc, :string, null: true
      change_column :billings, :cvv, :integer, null: true
      change_column :billings, :billing_zip, :integer, null: true
      change_column :billings, :address, :string, null: true
      change_column :billings, :city, :string, null: true
      change_column :billings, :state, :string, null: true
      change_column :billings, :zip, :integer, null: true
      change_column :billings, :expiration_date, :string, null: true
  end
end
