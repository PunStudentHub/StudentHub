class PagesController < ApplicationController
  def home
    @announcements = Announcement.all
  end

  def help
  end

  def contact
  end
end
