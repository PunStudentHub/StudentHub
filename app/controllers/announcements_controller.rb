class AnnouncementsController < ApplicationController
  before_action :admin_user, only: [:new, :edit, :update, :create, :destroy]

  def show
    @announcement = Announcement.find(params[:id])
  end

  def index
    @announcements = Announcement.all.paginate(page: params[:page])
  end

  def destroy
    Announcement.find(params[:id]).delete
    flash[:success] = "Announcement deleted!"
    redirect_to announcements_url
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end

  def update
    @announcement = Announcement.find(params[:id])
    if (@announcement.update_attributes(announcement_params))
      flash[:success] = "Announcement updated"
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
    @announcement = current_user.announcements.build if current_user.admin?
  end

  private
    def announcement_params
      params.require(:announcement).permit(:content, :title, {:class_year_ids => []})
    end


end
