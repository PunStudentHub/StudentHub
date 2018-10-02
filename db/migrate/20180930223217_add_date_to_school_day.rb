class AddDateToSchoolDay < ActiveRecord::Migration[5.2]
  def change
    add_column :school_days, :date, :date
  end
end
