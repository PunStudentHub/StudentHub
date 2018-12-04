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
      current_user.mod_actions.create(description: "Edited Club " + @club.hash_id,
      link: 'clubs/' + @club.hash_id)
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
    if !club.club_members.find_by(user_id: current_user.id).nil?
      flash[:secondary] = "You are already on this club's email list."
      redirect_to club
    elsif club.president == current_user
      flash[:secondary] = "You are the president of this club."
      redirect_to club
    else
      club.users << current_user
      flash[:secondary] = "You have joined this club's email list. You should now recieve club emails. Nice."
      redirect_to club
    end
  end

  def unapply
    club = Club.find_by_hash_id(params[:id])
    if !club.club_members.find_by(user_id: current_user.id).nil?
      club.club_members.find_by(user_id: current_user.id).delete
      flash[:secondary] = "You have been removed from this club's email list."
      redirect_to club
    elsif club.president == current_user
      flash[:secondary] = "You are the president of this club."
      redirect_to club
    else
      flash[:secondary] = "You are not on this club's mailing list and are thus unable to remove yourself from it."
      redirect_to club
    end
  end


  private
    def club_params
      params.require(:club).permit(:description, :name, :motto)
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
