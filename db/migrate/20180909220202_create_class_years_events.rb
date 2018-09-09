class CreateClassYearsEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events_class_years, id: false do |t|
      t.integer :event_id, :class_year_id
    end
  end
end
