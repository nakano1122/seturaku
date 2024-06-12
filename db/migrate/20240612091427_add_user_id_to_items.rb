class AddUserIdToItems < ActiveRecord::Migration[7.0]
  def up
    execute 'DELETE FROM items;'
    add_reference :items, :user, null: false, index: true
  end
  
  def down
    remove_reference :items, :user, index: true
  end
end
