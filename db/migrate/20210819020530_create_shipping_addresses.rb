class CreateShippingAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :shipping_addresses do |t|
      t.integer :end_user_id
      t.string :name
      t.string :address
      t.string :postal_code

      t.timestamps
    end
  end
end
