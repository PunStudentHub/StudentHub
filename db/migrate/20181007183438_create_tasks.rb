class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :duedate
      t.string :description
      t.timestamps
    end
  end
end
