class FixTimeEstimate < ActiveRecord::Migration[5.2]
  def change
    remove_column :taskees, :time_estimate
    add_column :taskees, :time_estimate, :integer
  end
end
