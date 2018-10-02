class AddTeachToRoles < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :teach, :boolean, default: false
  end
end
