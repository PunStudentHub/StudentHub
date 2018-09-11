class PagesController < ApplicationController
  def home
    @announcements = helpers.filter_announcements_class_years
    @subjects = Subject.all.sample(3)
  end

  def help
  end

  def contact
  end
end
