class AddUniqueIndesToTaskeesTasks < ActiveRecord::Migration[5.2]
  def change
    add_index :taskees_tasks, [:task_id, :taskee_id], unique: true
    add_index :taskees_tasks, :taskee_id
  end
end
