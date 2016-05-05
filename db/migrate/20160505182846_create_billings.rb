class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.integer :cc, null: false
      t.integer :cvv, null: false
      t.integer :billing_zip, null: false
      t.string :address1, null: false
      t.string :address2
      t.string :city, null: false
      t.string :state, null: false
      t.integer :zip, null: false
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
