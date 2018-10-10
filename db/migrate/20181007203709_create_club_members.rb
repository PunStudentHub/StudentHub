class CreateClubMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :club_members do |t|
      t.integer :club_id
      t.integer :user_id
      t.boolean :accepted
      t.timestamps
    end
  end
end
