class TasksTaskeesJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :tasks, :taskees do |t|
    end
  end
end
