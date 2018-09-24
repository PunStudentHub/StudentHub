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

    def has_permission permission
      if not logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to root_url
      else
        if current_user.roles.any?
          if current_user.can_do permission
            return
          end
        end
        flash[:danger] = "You aren't allowed to do that!"
        redirect_to(root_url)
      end
    end
end
