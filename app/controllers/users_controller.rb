class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action -> { correct_user(:admin) }, only: [:edit, :update]
  before_action -> { has_permission(:admin) }, only: [:destroy]
  before_action -> { has_permission(:approve) }, only: [:index] 
  before_action :not_logged_in, only: [:new, :create]


  def show
    @user = User.find_by_hash_id(params[:id])
    unless @user
      flash[:warning] = "That user does not exist!"
      redirect_to root_url
    end
  end

  def index
    @users = User.paginate(page: params[:page])
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
      params.require(:user).permit(:biography, class_year_ids: [])
    end

    def not_logged_in
      if logged_in?
        redirect_to(root_url)
        flash[:danger] = "You aren't allowed to do that!"
      end
    end

end
