class AddAddressesToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :addresses, :integer
  end
end
