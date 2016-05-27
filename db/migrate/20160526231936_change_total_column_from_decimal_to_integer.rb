class ChangeTotalColumnFromDecimalToInteger < ActiveRecord::Migration
  def change
    change_column :orders, :total, :integer
  end
end
