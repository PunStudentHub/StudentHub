class AnnouncementsController < ApplicationController

  before_action -> {has_permission(:moderate)}, only: [:edit, :update, :destroy]
  before_action :not_banned, only: [:create, :new]

  include Approvable

  def linked_model 
    Announcement
  end

  def show
    @announcement = Announcement.find_by_hash_id(params[:id])
  end

  def index
    if logged_in?
      if current_user.can_do (:approve)
        @announcements = helpers.filter_class_years(Announcement)
                                  .paginate(page: params[:page], per_page: 25)
        return
      end
    end

    @announcements = helpers.filter_class_years(Announcement.approved_announcements)
                                  .paginate(page: params[:page], per_page: 25)
  end

  def destroy
    Announcement.find_by_hash_id(params[:id]).delete
    flash[:success] = "Announcement deleted!"
    redirect_to announcements_url
  end

  def edit
    @announcement = Announcement.find_by_hash_id(params[:id])
  end

  def update
    @announcement = Announcement.find_by_hash_id(params[:id])
    if (@announcement.update_attributes(announcement_params))
      flash.now[:success] = "Announcement updated"
      redirect_to @announcement
    else
      render 'edit'
    end
  end

  def create
    @announcement = current_user.announcements.build(announcement_params)
    @announcement.approved = !!(current_user.can_do(:approve))
    if (@announcement.save)
      flash[:success] = "Announcement created!"
      redirect_to @announcement
    else
      render 'new'
    end

    if (!@announcement.approved)
      flash[:success] += " It will be shown after a moderator approves it!"
    end
  end

  def new
    @announcement = current_user.announcements.build
  end

  private
    def announcement_params
      params.require(:announcement).permit(:content, :title, {:class_year_ids => []})
    end


end
