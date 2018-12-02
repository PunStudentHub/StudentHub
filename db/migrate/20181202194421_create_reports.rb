class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.text :report
      t.string :link
      t.references :user, foreign_key: true
      t.text :response
      t.references :responder

      t.timestamps
    end
    add_foreign_key :reports, :users, column: :responder_id
  end
end
