class AddTimeEstimateToTaskee < ActiveRecord::Migration[5.2]
  def change
    add_column :taskees, :time_estimate, :duration
  end
end
