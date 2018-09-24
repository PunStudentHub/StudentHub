class AddIndexToAllHashId < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :hash_id, unique: true
    add_index :announcements, :hash_id, unique: true
  end
end
