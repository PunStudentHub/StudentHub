class CreateJoinTableEventsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :events, :users do |t|

    end
  end
end
