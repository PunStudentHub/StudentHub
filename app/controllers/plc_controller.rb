class PlcController < ApplicationController
  def index
    @subjects = Subject.all
    if params[:subject]
      @selected_subject = @subjects.friendly.find(params[:subject])
      @timeslots = @selected_subject.timeslots
    else
      @selected_subject = nil
      @timeslots = nil
    end
  end
end
