class DefaultUncompletedTaskees < ActiveRecord::Migration[5.2]
  def change
    change_column :taskees, :completed, :boolean, :default => 0
  end
end
