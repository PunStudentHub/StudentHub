class AddFacultyModColumnToRoles < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :faculty_mod, :boolean, default: false
  end
end
