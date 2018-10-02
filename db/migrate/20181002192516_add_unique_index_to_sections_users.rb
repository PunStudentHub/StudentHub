class AddUniqueIndexToSectionsUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :sections_users, [:section_id, :user_id], unique: true
    add_index :sections_users, :user_id
  end
end
