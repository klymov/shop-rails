class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name_category
      t.timestamps
    end
    add_column :items, :category_id, :integer
    remove_column :items, :category
  end
end
