class ClubsController < ApplicationController

  include Approvable

  def linked_model
    Club
  end

  before_action :logged_in_user
  before_action :club_president, only: [:accept_user, :edit, :update]
  before_action :not_banned, except: [:index, :show]
  before_action -> {has_permission :admin}, only: [:destroy]

  def new
    @club = current_user.leaderships.build
  end

  def create
    @club = current_user.leaderships.build(club_params)
    if (@club.save)
      @club.users << current_user
      @club.club_members.update_all(accepted: true)
      flash[:success] = "Club created!"
      redirect_to clubs_path
    else
      render 'new'
    end
  end

  def edit
    @club = Club.find_by_hash_id(params[:id])
  end

  def update
    @club = Club.find_by_hash_id(params[:id])
    if (@club.update_attributes(club_params))
      flash[:success] = "Club updated"
      redirect_to @club
    else
      render 'edit'
    end
  end

  def destroy
    Club.find_by_hash_id(params[:id]).delete
    flash[:success] = "Club deleted!"
    redirect_to clubs_url
  end

  def show
    @club = Club.find_by_hash_id(params[:id])
    @members = @club.users
  end

  def index
    if logged_in?
      if (current_user.can_do(:approve) || current_user.can_do(:faculty_mod))
        @clubs = Club.all
        @filter = params[:filter]
        if params[:filter] == 'Rejected'
          @clubs = @clubs.rejected
        elsif params[:filter] == 'Approved'
          @clubs = @clubs.approved
        elsif params[:filter] == 'Pending'
          @clubs = @clubs.awaiting_approval
        end
      else
        @clubs = Club.approved             
      end
    else
      @clubs = []
    end
  end


  def apply
    club = Club.find_by_hash_id(params[:id])
    unless club.president == current_user
      club.users << current_user
      flash[:info] = "You have applied to join this club. You need to be approved by 
                            the club president to show up on this page."
      redirect_to club
    else
      flash[:info] = "You are the president of this club. What are you doing?"
      redirect_to club
    end
  end

  def accept_user
    club = Club.find_by_hash_id(params[:id])
    member = club.club_members.find_by_user_id(params[:user_id])
    member.update_attribute(:accepted, true)
    redirect_to club
  end

  private
    def club_params
      params.require(:club).permit(:description, :name)
    end

    def club_president
      @club = Club.find_by_hash_id(params[:id])
      if logged_in?
        return if ((current_user == @club.president) || current_user.can_do(:admin))
      end
      flash[:warning] = "You don't have permission!"
      redirect_to @club
    end
end