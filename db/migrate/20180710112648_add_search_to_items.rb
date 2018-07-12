class AddSearchToItems < ActiveRecord::Migration[5.2]
  def up
    drop_table :items

      create_table :items do |t|
        t.integer :category_id
        t.string  :name
        t.string  :description
        t.float   :price
        t.string  :quantity
        t.string  :images
        t.boolean :searching, default: false
        t.timestamps
      end
      add_index :items, :category
      add_index :items, :name
      add_index :items, :description
      add_index :items, :price
    end

end