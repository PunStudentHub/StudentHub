class AddHashIdAndApprovedToClubs < ActiveRecord::Migration[5.2]
  def up
    add_column :clubs, :hash_id, :string, index: true
    Club.all.each{|m| m.set_hash_id; m.save}
    add_column :clubs, :approved, :boolean, default: false
  end

  def down
    remove_column :clubs, :hash_id, :string
    remove_column :clubs, :approved, :string
  end
end
