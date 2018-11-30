class CreateModActions < ActiveRecord::Migration[5.2]
  def change
    create_table :mod_actions do |t|
      t.references :user, foreign_key: true
      t.text :description
      t.text :link
      
      t.timestamps
    end
  end
end
