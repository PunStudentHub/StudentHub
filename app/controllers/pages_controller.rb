class PagesController < ApplicationController

  before_action :logged_in_user, only: [:staff]
  before_action -> {has_permission(:admin)}, only: [:modlog]

  def home
    if logged_in?
      @announcements = Announcement.filter_class_years(current_user).approved
    else
      @announcements = Announcement.approved
    end
    @subjects = Subject.all.sample(3)
    @blogposts = BlogPost.take(3)

    @all_events = Event.approved
    @event_dates = []

    Event.all.finalized.future_day_events.each do |e|
      @event_dates << (e.start_time.strftime("%j").to_s + "-" + e.start_time.strftime("%y").to_s )
    end
    @event_dates = @event_dates.uniq
    unless @event_dates.first.nil?
      @first_nonempty_day = DateTime.strptime(@event_dates.first, "%j-%y")
      @first_day_events = Event.all.finalized.set_day_events(@first_nonempty_day.to_date).sample(3)
    end
    unless @event_dates.second.nil?
      @second_nonempty_day = DateTime.strptime(@event_dates.second, "%j-%y")
      @second_day_events = Event.all.finalized.set_day_events(@second_nonempty_day.to_date).sample(3)
    end

    @today = Event.all.approved.today.sample(3)
    @tomorrow = Event.all.approved.tomorrow.sample(3)
    @day_after_tomorrow = Event.all.approved.day_after_tomorrow.sample(3)

    @clubs = Club.finalized.all.sample(3) 
  end

  def help
  end

  def contact
    @people = Role.find_by(name: "Admin").users
  end

  def staff
    @admins = Role.find_by(name: "Admin").users
    @mods = Role.find_by(name: "Moderator").users
  end

  def modlog
    @actions = ModAction.all.paginate(page: params[:page], per_page: 50)
  end

  def feedback
  end
end
