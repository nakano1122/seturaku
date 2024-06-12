class AddItemsCategoryAndDescription < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :category, :string, after: :item_name
    add_column :items, :description, :text, after: :category
  end
end
