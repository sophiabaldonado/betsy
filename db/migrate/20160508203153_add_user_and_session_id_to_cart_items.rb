class AddUserAndSessionIdToCartItems < ActiveRecord::Migration
  def change
    add_column :cart_items, :session_id, :string
    add_column :cart_items, :user_id, :string
  end
end
