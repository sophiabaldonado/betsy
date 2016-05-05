class MakeCreditCardString < ActiveRecord::Migration
  def change
    change_column :billings, :cc, :string
  end
end
