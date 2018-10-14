
class PlcController < ApplicationController
  def index
    @subjects = Subject.all
    @array = []
    Subject.all.each do |subject|
      @array << {
        name: subject.name,
        hash_id: subject.hash_id,
        timeslots: subject.timeslots.map do |t|
          [t.day, t.time]
        end
      }
    end
  end

end
