class CreateJoinTableClubsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :clubs, :users do |t|

    end
  end
end
