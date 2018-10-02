class AddUniqueIndexToTaskees < ActiveRecord::Migration[5.2]
  def change
    add_index :Taskees, [:doer_id, :doer_type], unique: true
  end
end
