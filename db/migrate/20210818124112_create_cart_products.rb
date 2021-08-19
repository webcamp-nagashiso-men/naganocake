class CreateCartProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_products do |t|
      t.integer :product_id
      t.integer :end_user_id
      t.integer :quantity
      t.timestamps
    end
  end
end
