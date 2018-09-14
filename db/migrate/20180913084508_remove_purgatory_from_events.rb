class RemovePurgatoryFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :purgatory, :string
  end
end
