class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|

      t.timestamps

      t.integer :user_id
      t.integer :postage
      t.integer :total_price
      t.string :name
      t.string :address
      t.string :postal_code
      t.integer :order_status, null: false, default: 0
      t.integer :payment_method, null: false, default: 0
    end
  end
end
