class AddPurgatoryColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :purgatory, :string
    add_column :events, :boolean, :string
  end
end
