class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :color
      t.boolean :approve, default: false
      t.boolean :blog, default: false
      t.boolean :moderate, default: false
      t.boolean :admin, default: false
      t.timestamps
    end
  end
end
