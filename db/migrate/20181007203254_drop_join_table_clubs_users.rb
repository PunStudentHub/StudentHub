class DropJoinTableClubsUsers < ActiveRecord::Migration[5.2]
  def change
    drop_join_table :clubs, :users
  end
end
