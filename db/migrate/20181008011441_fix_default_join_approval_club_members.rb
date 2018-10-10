class FixDefaultJoinApprovalClubMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :club_members, :accepted, :boolean
    add_column :club_members, :accepted, :boolean, default: false
  end
end
