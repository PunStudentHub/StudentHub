class AddFilterableByYearIdToClassYears < ActiveRecord::Migration[5.2]
  def change
    add_column :class_years, :filterable_by_year_id, :integer
  end
end
