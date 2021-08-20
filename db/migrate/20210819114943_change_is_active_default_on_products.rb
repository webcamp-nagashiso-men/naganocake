class ChangeIsActiveDefaultOnProducts < ActiveRecord::Migration[5.0]
  def up
  change_column :products, :is_active,:boolean, default: true
  end
end
