class AddApprovedBooleanToAnnouncements < ActiveRecord::Migration[5.2]
  def change
    add_column :announcements, :approved, :boolean
  end
end
