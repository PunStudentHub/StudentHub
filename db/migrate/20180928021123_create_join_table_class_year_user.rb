class CreateJoinTableClassYearUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :class_years, :users do |t|

    end
  end
end
