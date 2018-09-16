class AnnouncementsController < ApplicationController

  before_action -> {has_permission(:moderate)}, only: [:new, :edit, :update, :create, :destroy]

  def show
    @announcement = Announcement.friendly.find(params[:id])
  end

  def index
    @announcements = helpers.filter_announcements_class_years.paginate(page: params[:page], per_page: 25)
  end

  def destroy
    Announcement.friendly.find(params[:id]).delete
    flash.now[:success] = "Announcement deleted!"
    redirect_to announcements_url
  end

  def edit
    @announcement = Announcement.friendly.find(params[:id])
  end

  def update
    @announcement = Announcement.friendly.find(params[:id])
    if (@announcement.update_attributes(announcement_params))
      flash.now[:success] = "Announcement updated"
      redirect_to @announcement
    else
      render 'edit'
    end
  end

  def create
    @announcement = current_user.announcements.build(announcement_params)
    if (@announcement.save)
      flash[:success] = "Announcement created!"
      redirect_to @announcement
    else
      render 'new'
    end
  end

  def new
    @announcement = current_user.announcements.build if current_user.can_do :moderate
  end

  private
    def announcement_params
      params.require(:announcement).permit(:content, :title, {:class_year_ids => []})
    end


end
