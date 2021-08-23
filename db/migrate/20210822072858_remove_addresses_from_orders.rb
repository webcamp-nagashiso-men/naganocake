class RemoveAddressesFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :addresses, :integer
  end
end
