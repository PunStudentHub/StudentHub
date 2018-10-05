class AddHashIdToSections < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :hash_id, :string, index: true
    Section.all.each{|m| m.set_hash_id; m.save}
  end
end
