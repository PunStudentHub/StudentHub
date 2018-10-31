class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if (@user.class_years.empty?)
      if (@user.email =~ /19|20|21|22/)
        @user.update_attribute(:class_years, [@user.find_classyear])
        @user.save
      elsif (@user.email =~ /[0-9]{2}/) # someone with a punahou email that isn't in right range
        flash[:danger] = "You aren't approved to join the Punahou Student Hub. 
                          Only students currently in the Academy may do so."
        return
      else
        @user.update_attribute(:class_years, ClassYear.all)
        @user.save
      end
    end

    if User.find_by(email: @user.email)
      session[:user_id] = @user.id
      log_in @user
      redirect_to user_path(@user)
    else
      if @user.valid?
        @user.save
      end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def update_class_years

  end

end
