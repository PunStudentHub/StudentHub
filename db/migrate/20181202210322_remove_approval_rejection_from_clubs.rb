class RemoveApprovalRejectionFromClubs < ActiveRecord::Migration[5.2]
  def change
    remove_column :clubs, :approved
    remove_column :clubs, :rejected
  end
end
