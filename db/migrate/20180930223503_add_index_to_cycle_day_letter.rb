class AddIndexToCycleDayLetter < ActiveRecord::Migration[5.2]
  def change
    add_index :cycle_days, :letter, unique: true
  end
end
