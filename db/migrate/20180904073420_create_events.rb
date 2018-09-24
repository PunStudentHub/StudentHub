class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.text :description
      t.datetime :start_time
      t.datetime :finish_time
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :events, [:start_time, :user_id, :created_at]
  end
end
