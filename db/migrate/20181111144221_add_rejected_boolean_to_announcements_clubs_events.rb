class AddRejectedBooleanToAnnouncementsClubsEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :announcements,  :rejected, :boolean, default: false
    add_column :events,         :rejected, :boolean, default: false
    add_column :clubs,          :rejected, :boolean, default: false
  end
end
