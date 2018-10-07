class CreateTaskees < ActiveRecord::Migration[5.2]
  def change
    create_table :taskees do |t|
      t.belongs_to :user, index: true
      t.belongs_to :task, index: true
      t.boolean :completed
      t.timestamps
    end
  end
end
