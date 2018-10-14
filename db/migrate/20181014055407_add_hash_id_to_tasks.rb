class AddHashIdToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :hash_id, :string, index: true
    Task.all.each{|m| m.set_hash_id; m.save}
  end
end
