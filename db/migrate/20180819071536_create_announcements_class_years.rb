class CreateAnnouncementsClassYears < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements_class_years, id: false do |t|
      t.integer :announcement_id, :class_year_id
    end
  end
end
