class AddIndexToSubjectHashId < ActiveRecord::Migration[5.2]
  def change
    add_index :subjects, :hash_id, unique: true
  end
end
