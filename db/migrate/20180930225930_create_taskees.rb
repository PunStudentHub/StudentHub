class CreateTaskees < ActiveRecord::Migration[5.2]
  def change
    create_table :taskees do |t|
      t.integer :doer_id
      t.string :doer_type
      t.timestamps
    end
  end
end
