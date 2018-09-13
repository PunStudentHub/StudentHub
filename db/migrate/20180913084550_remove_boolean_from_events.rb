class RemoveBooleanFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :boolean, :string
  end
end
