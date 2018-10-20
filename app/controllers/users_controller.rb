class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action -> { correct_user(:admin) }, only: [:edit, :update]
  before_action -> { has_permission(:admin) }, only: [:destroy, :update_perms]
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
      flash[:success] = "Settings updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find_by_hash_id(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def update_perms
    @user = User.find_by_hash_id(params[:id])
    if (@user.roles.include?(Role.find(1)))
      @user.roles = [Role.find(1)]
    else
      @user.roles = []
    end

    params[:user][:roles].each do |r|
      @user.roles << Role.find(r) unless r.empty?
    end
    redirect_to @user
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
