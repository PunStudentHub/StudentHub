class DropClassYears < ActiveRecord::Migration[5.2]
  def change
    drop_table :class_years
  end
end
