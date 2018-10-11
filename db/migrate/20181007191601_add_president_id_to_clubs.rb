class AddPresidentIdToClubs < ActiveRecord::Migration[5.2]
  def change
    change_table :clubs do |t|
      t.references :president, index: true
    end
    add_foreign_key :clubs, :users, column: :president_id
  end
end
