class AddHashIdToAnnouncements < ActiveRecord::Migration[5.2]
  def up
    add_column :announcements, :hash_id, :string, index: true
    Announcement.all.each{|m| m.set_hash_id; m.save}
  end

  def down
   remove_column :announcements, :hash_id, :string
  end
end
