class EventsController < ApplicationController

  before_action -> {has_permission :moderate}, only: [:destroy]
  before_action -> {has_permission :approve}, only: [:approve]

  def show
    @event = Event.friendly.find(params[:id])
  end

  def index
    #eventually should display as a calender, troopwebhostesque
    @events = Event.all.paginate(page: params[:page], per_page: 25)
  end

  def destroy
    Event.friendly.find(params[:id]).delete
    flash[:success] = "Event deleted!"
    redirect_to events_url
  end

  def edit
    @event = Event.friendly.find(params[:id])
  end

  def update
    @event = Event.friendly.find(params[:id])
    if (@event.update_attributes(event_params))
      flash.now[:success] = "Event updated"
      redirect_to events_path
    else
      render 'edit'
    end
  end

  def new
    @event = current_user.events.build
  end

  def approve
    @event = Event.friendly.find(params[:id])
    @event.update_attributes(approved: true)
    redirect_to request.referrer
  end

  def rsvp
    @event = Event.friendly.find(params[:id])
    @event.users << current_user
    redirect_to request.referrer
  end

  def unrsvp
    @event = Event.friendly.find(params[:id])
    @event.users.destroy(current_user)
    redirect_to request.referrer
  end

  def create
    @event = current_user.events.build(event_params)
    @event.user_id = current_user.id
    @event.approved = !!(current_user.can_do(:approve))
    if (@event.save)
      if (@event.approved)
        flash[:success] = "Event created!"
        redirect_to @event
      else
        flash[:danger] = "Your event is anxiously awaiting moderator approval."
        redirect_to events_path
      end
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :description, :approved, :start_time, :end_time)

  end

end
