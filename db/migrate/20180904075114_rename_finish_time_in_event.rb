class RenameFinishTimeInEvent < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :finish_time, :datetime
    add_column :events, :end_time, :datetime
  end
end
