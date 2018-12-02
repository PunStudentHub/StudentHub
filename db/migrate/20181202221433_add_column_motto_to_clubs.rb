class AddColumnMottoToClubs < ActiveRecord::Migration[5.2]
  def change
    add_column :clubs, :motto, :string
  end
end
