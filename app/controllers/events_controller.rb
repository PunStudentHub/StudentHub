class EventsController < ApplicationController

  before_action :admin_user, only: [:destroy]

  def show
    @event = Event.friendly.find(params[:id])
  end

  def index
    #eventually should display as a calender, troopwebhostesque
    @events = Event.all.paginate(page: params[:page], per_page: 25)
  end

  def destroy
    Events.friendly.find(params[:id]).delete
    flash[:success] = "Event deleted!"
    redirect_to events_url
  end

  def edit
    @event = Event.friendly.find(params[:id])
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
    @event = current_user.events.build(event_params)
    @event.approved = !!current_user.admin
    if (@event.save)
      flash[:success] = "Event created!"
      redirect_to @event
    else
      render 'new'
    end
#admins can aprove events currently
#in purgatory, they get posted to
#main events page
  end

  def approve
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :description, :purgatory, :start_time, :end_time)

  end

end
