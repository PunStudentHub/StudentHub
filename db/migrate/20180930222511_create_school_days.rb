class CreateSchoolDays < ActiveRecord::Migration[5.2]
  def change
    create_table :school_days do |t|
      t.references :cycle_day, foreign_key: true

      t.timestamps
    end
  end
end
