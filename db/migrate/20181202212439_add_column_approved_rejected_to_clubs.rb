class AddColumnApprovedRejectedToClubs < ActiveRecord::Migration[5.2]
  def change
    add_column :clubs, :approved, :boolean, default: false
    add_column :clubs, :rejected, :boolean, default: false
  end
end
