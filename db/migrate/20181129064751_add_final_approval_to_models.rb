class AddFinalApprovalToModels < ActiveRecord::Migration[5.2]
  def change
    add_column :announcements,  :final, :boolean, default: false
    add_column :events,         :final, :boolean, default: false
    add_column :clubs,          :final, :boolean, default: false
  end
end
