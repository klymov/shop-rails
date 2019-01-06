class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :category
      t.string  :name
      t.string  :description
      t.float   :price
      t.string  :quantity
      t.timestamps
    end
    add_index :items, :category
    add_index :items, :name
    add_index :items, :description
    add_index :items, :price
  end
end
