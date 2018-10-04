class SectionsUsersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :sections, :users do |t|
    end
  end
end
