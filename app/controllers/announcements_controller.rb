class AnnouncementsController < ApplicationController

  before_action -> {has_permission(:moderate)}, only: [:edit, :update, :destroy, :reject]
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
        @announcements = Announcement.all
        @filter = params[:filter]
        if params[:filter] == 'Rejected'
          @announcements = @announcements.rejected
        elsif params[:filter] == 'Approved'
          @announcements = @announcements.approved
        elsif params[:filter] == 'Pending'
          @announcements = @announcements.awaiting_approval
        elsif params[:filter] == 'My Class'
          @announcements = @announcements.filter_class_years(current_user).approved
        end
        @announcements = @announcements.paginate(page: params[:page], per_page: 25)
      else
        @announcements = Announcement.filter_class_years(current_user)
                                     .approved
                                     .paginate(page: params[:page], per_page: 25)
      end
    else
      @announcements = Announcement.approved
                                   .paginate(page: params[:page], per_page: 25)
    end
  end

  def destroy
    Announcement.find_by_hash_id(params[:id]).delete
    flash[:success] = "Announcement deleted!"
    redirect_back(fallback_location: root_path)
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
      if (!@announcement.approved)
        flash[:success] += " It will be shown after a moderator approves it!"
      end
    else
      render 'new'
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
