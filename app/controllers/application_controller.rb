class ApplicationController < ActionController::Base
  include SessionsHelper

  private
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to root_url
      end
    end

    def admin_user
      if not logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to root_url
      elsif not current_user.admin?
        flash[:danger] = "You aren't allowed to do that!"
        redirect_to(root_url)
      end
    end
end
