class AddLocationToSections < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :location, :string
  end
end
