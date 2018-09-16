class PagesController < ApplicationController

  before_action :logged_in_user, only: [:staff]

  def home
    @announcements = helpers.filter_announcements_class_years
    @subjects = Subject.all.sample(3)
    @blogposts = BlogPost.all.sample(3)
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
end
