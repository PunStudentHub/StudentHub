class AddNameToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :name, :string
    add_column :tasks, :content, :string
    add_column :tasks, :duedate, :datetime
  end
end
