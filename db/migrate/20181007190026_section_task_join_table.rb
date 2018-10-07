class SectionTaskJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :sections, :tasks do
    end
  end
end
