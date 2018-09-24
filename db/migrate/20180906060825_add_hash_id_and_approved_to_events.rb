class AddHashIdAndApprovedToEvents < ActiveRecord::Migration[5.2]
  def up
    add_column :events, :hash_id, :string, index: true
    #Event.all.each{|m| m.set_hash_id; m.save}

    add_column :events, :approved, :boolean, default: false
  end


  def down
   remove_column :events, :hash_id, :string
   remove_column :events, :approved, :boolean
  end
end
