require 'csv'

namespace :plc do
  desc "TODO"
  task import: :environment do
    Timeslot.delete_all
    Subject.delete_all
    CSV.foreach("#{Rails.root}/db/data/plc.csv") do |row|
      slot = Timeslot.new(day: row[0], time: row[1])
      row[2..row.length-1].each do |subject_str|
        if Subject.find_by(name: subject_str)
          slot.subjects << Subject.find_by(name: subject_str)
        else
          slot.subjects << Subject.create(name: subject_str)
        end
        slot.save
      end
    end
  end
end
