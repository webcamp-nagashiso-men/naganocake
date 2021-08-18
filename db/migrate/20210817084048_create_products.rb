class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :name
      t.integer :price
      t.text :guide
      t.string :image_id
      t.boolean :is_active

      t.timestamps
    end
  end
end
