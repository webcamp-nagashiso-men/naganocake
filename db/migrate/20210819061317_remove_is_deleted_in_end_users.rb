class RemoveIsDeletedInEndUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :end_users, :is_deleted, :boolean
  end
end