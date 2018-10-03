class AddBannedBooleanToRoles < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :banned, :boolean, default: false
  end
end
