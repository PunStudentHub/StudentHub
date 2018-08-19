class CreateClassYears < ActiveRecord::Migration[5.2]
  def change
    create_table :class_years do |t|

      t.timestamps
    end
  end
end
