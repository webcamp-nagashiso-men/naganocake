class RenameHurigaaLastColumnToEndUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :end_users, :hurigaa_last, :hurigana_last
  end
end
