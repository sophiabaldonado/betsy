class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status
      t.datetime :confirmation_date
      t.integer :billing_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
