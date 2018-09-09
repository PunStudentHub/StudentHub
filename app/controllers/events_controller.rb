class EventsController < ApplicationController

  before_action :admin_user, only: [:create, :destroy]

  def show
    @event = Event.friendly.find(params[:id])
  end

  def index
    @events = Event.all.paginate(page: params[:page], per_page: 25)
  end

  def destroy
    Events.friendly.find(params[:id]).delete
    flash[:success] = "Event deleted!"
    redirect_to events_url
  end

  def edit
#need to make sure only admins and whoever posted event
#can edit
  end

  def update

  end

  def new
    @event = current_user.events.build
#anyone can make a new event, gets
#put in event purgatory until
#an admin creates

  end

  def create
#admins can aprove events currently
#in purgatory, they get posted to
#main events page
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :description, :purgatory, :start_time, :end_time)

  end

end
