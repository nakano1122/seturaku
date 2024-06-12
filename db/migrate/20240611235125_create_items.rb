class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :price
      t.date :bought_at

      t.timestamps
    end
  end
end
