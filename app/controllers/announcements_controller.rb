class AnnouncementsController < ApplicationController
  def show
    @announcement = Announcement.find(params[:id])
  end

  def index
    @announcements = Announcement.all.paginate(page: params[:page])
  end

end
