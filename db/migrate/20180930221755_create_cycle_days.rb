class CreateCycleDays < ActiveRecord::Migration[5.2]
  def change
    create_table :cycle_days do |t|
      t.string :letter

      t.timestamps
    end
  end
end
