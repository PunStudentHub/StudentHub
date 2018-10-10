class AddClubIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :club, foreign_key: true
  end
end
