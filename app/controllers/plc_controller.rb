class PlcController < ApplicationController
  def index
    @subjects = Subject.all
    if params[:subject]
      @selected_subject = @subjects.find_by_hash_id(params[:subject])
      @timeslots = @selected_subject.timeslots
    else
      @selected_subject = nil
      @timeslots = nil
    end
  end

  def subject_slots
    @subject = Subject.find_by_hash_id(params[:subject])
    render  json: {name: @subject.name, hash_id: @subject.hash_id, 
            timeslots: @subject.timeslots.map do |t|
              [t.day, t.time]
            end }

  end
end
