class RemoveColumnAcceptedFromClubMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :club_members, :accepted
  end
end
