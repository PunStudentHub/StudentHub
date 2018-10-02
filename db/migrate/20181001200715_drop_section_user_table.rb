class DropSectionUserTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :section_user
  end
end
