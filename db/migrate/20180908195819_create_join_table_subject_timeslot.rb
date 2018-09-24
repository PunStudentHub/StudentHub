class CreateJoinTableSubjectTimeslot < ActiveRecord::Migration[5.2]
  def change
    create_join_table :subjects, :timeslots do |t|
      # t.index [:subject_id, :timeslot_id]
      # t.index [:timeslot_id, :subject_id]
    end
  end
end
