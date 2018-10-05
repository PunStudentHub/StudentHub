class AddUSerIdToSections < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :user_id, :string
  end
end
