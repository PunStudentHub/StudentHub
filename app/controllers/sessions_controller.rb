class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if User.find_by(email: @user.email)
      session[:user_id] = @user.id
      log_in @user
      redirect_to user_path(@user)
    else
      @user.save
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def update_class_years

  end

end
