class EventsController < ApplicationController

  include Approvable

  def linked_model
    Event
  end

  before_action -> {has_permission :admin}, only: [:destroy]

  before_action :not_banned, only: [:new, :create, :update, :edit]
  before_action :logged_in_user


  def show
    @event = Event.friendly.find(params[:id])
  end

  def index
    if logged_in?
      if (current_user.can_do(:approve) || current_user.can_do(:faculty_mod))
        @events = Event.future_events
        @filter = params[:filter]
        if params[:filter] == 'Rejected'
          @events = @events.rejected
        elsif params[:filter] == 'Approved'
          @events = @events.approved
        elsif params[:filter] == 'Pending'
          @events = @events.awaiting_approval
        elsif params[:filter] == 'Past'
          @events = Event.past_events
        end
      else
        @events = Event.future_events.approved
      end
    else
      @events = Event.future_events.approved
    end
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
      redirect_to event_path(@event)
      current_user.mod_actions.create(description: "Edited Event " + @event.hash_id,
      link: 'events/' + @event.hash_id)
    else
      render 'edit'
    end
  end

  def new
    @event = current_user.events.build
  end



  def rsvp
    @event = Event.friendly.find(params[:id])
    unless @event.users.exists?(current_user.id)
      @event.users << current_user
    end
    if (params[:redirect])
      redirect_to request.referrer
    end
  end

  def unrsvp
    @event = Event.friendly.find(params[:id])
    if @event.users.exists?(current_user.id)
      @event.users.destroy(current_user)
    end
    if (params[:redirect])
      redirect_to request.referrer
    end
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



  #private

  def event_params
    new_params = params.require(:event).permit(:title, :location, :description, :approved, :club)

    unless params[:start].nil?
      new_params[:start_time] = DateTime.strptime(params[:start], '%b-%d-%y %H:%M') + 10.hours
    end
    unless  params[:end].nil?
      new_params[:end_time] = DateTime.strptime(params[:end], '%b-%d-%y %H:%M') + 10.hours
    end
    unless new_params[:club].nil?
      unless new_params[:club].empty?
        new_params[:club] = Club.find(new_params[:club])
      else
        new_params[:club] = nil
      end
    end

    new_params
  end

end
