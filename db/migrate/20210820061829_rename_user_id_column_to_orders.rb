class RenameUserIdColumnToOrders < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :user_id, :end_user_id
  end
end
