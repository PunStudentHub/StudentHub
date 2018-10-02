class AddNameToSections < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :name, :string
  end
end
