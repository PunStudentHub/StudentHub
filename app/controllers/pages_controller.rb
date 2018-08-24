class PagesController < ApplicationController
  def home
    @announcements = helpers.filter_announcements_class_years
  end

  def help
  end

  def contact
  end
end
