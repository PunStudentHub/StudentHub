class PagesController < ApplicationController

  before_action :logged_in_user, only: [:staff]

  def home
    if logged_in?
      @announcements = Announcement.filter_class_years(current_user).approved_announcements
    else
      @announcements = Announcement.approved_announcements
    end
    @subjects = Subject.all.sample(3)
    @blogposts = BlogPost.take(3)

    @today = Event.all.approved_events.today.sample(3)
    @tomorrow = Event.all.approved_events.tomorrow.sample(3)
    @day_after_tomorrow = Event.all.approved_events.day_after_tomorrow.sample(3)

    @clubs = Club.all.sample(3) 
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

  def feedback
  end
end
