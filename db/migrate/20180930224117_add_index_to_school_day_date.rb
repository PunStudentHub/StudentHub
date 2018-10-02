class AddIndexToSchoolDayDate < ActiveRecord::Migration[5.2]
  def change
    add_index :school_days, :date, unique: true
  end
end
