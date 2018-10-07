class AddPresidentIdToClubs < ActiveRecord::Migration[5.2]
  def change
    add_reference :clubs, :president, index: true, foreign_key: true
  end
end
