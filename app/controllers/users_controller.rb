class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action -> { has_permission(:admin) }, only: [:destroy]
  before_action -> { has_permission(:approve) }, only: [:index] 
  before_action :not_logged_in, only: [:new, :create]


  def new
    @user = User.new
  end

  def show
    id = User.find_by_hash_id(params[:id])
    @user = id
#    unless @user.activated?
#      flash[:warning] = "That account is not activated!"
#      redirect_to root_url and return
#    end
    @announcements = Announcement.where(user_id: id).paginate(page: params[:announcement_page], per_page: 1)
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by_hash_id(params[:id])
  end

  def update
    @user = User.find_by_hash_id(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find_by_hash_id(params[:id]).destroy
    flash[:success] = "User Deleted"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:biography)
    end

    def correct_user
      @user = User.find_by_hash_id(params[:id])
      redirect_to(edit_user_path(@user)) unless current_user?(@user)
    end

    def not_logged_in
      if logged_in?
        redirect_to(root_url)
        flash[:danger] = "You aren't allowed to do that!"
      end
    end

end
